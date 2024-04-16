Class {
	#name : #InferenceEngine,
	#superclass : #Object,
	#instVars : [
		'factBase',
		'ruleBase',
		'currentRule'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #examples }
InferenceEngine class >> example [ 
	| res |
	res := self new 
		factBase: FactBase example ;
		ruleBase: RuleBase example ;
		yourself.
	res initializeCurrentRule.
	^res
	
]

{ #category : #accessing }
InferenceEngine >> currentRule [

	^ currentRule
]

{ #category : #accessing }
InferenceEngine >> currentRule: anObject [
	currentRule := anObject.
	self changed.
]

{ #category : #accessing }
InferenceEngine >> factBase [

	^ factBase
]

{ #category : #accessing }
InferenceEngine >> factBase: anObject [
	factBase := anObject.
	self changed.
]

{ #category : #initialization }
InferenceEngine >> initialize [ 
self ruleBase: RuleBase new.
self factBase: FactBase new.
self initializeCurrentRule.

]

{ #category : #initialization }
InferenceEngine >> initializeCurrentRule [
	| regles_active |
	
	" on evalue la condition d'arret." 
	regles_active := self selectionneReglesActives.
	(regles_active isEmpty)  
		
		ifFalse: " attention s'arreter si 1 enfant"
			"On choisi la nouvelle regle courante."
			"On récupère une regle a evaluer parmis les actives (suivant son poids)"
			[ self currentRule: (self regleAEvalueWithRuleBase: regles_active) ]
		
		ifTrue: [ self currentRule: nil ].
	self changed.

	^self.
]

{ #category : #printing }
InferenceEngine >> printOn: aStream [

	self currentRule
		ifNil: [ aStream nextPutAll: 'Terminé !' ]
		ifNotNil: [ aStream nextPutAll: self currentRule name ]
]

{ #category : #'as yet unclassified' }
InferenceEngine >> regleAEvalue [
	| regle_courante |
	regle_courante := (self ruleBase) first.
	self ruleBase rules do: [ :each | regle_courante := regle_courante max: each ].
	^ regle_courante 
]

{ #category : #'as yet unclassified' }
InferenceEngine >> regleAEvalueWithRuleBase: aRuleBase [
	| regle_courante |
	regle_courante := (aRuleBase) at: 1.
	aRuleBase do: [ :each | regle_courante := regle_courante max: each ].
	^ regle_courante 
]

{ #category : #accessing }
InferenceEngine >> ruleBase [

	^ ruleBase
]

{ #category : #accessing }
InferenceEngine >> ruleBase: anObject [
	ruleBase := anObject.
	self changed.
]

{ #category : #running }
InferenceEngine >> run [ 
	| regles_active |
	regles_active := self selectionneReglesActives.
	Transcript show: 'Règles actives : ', regles_active size printString; cr.
	[regles_active isEmpty]  whileFalse: 
	"(regles_active isEmpty)  ifFalse: "
	[ |r b | 
	"On récupère une regle a evaluer parmis les actives (suivant son poids)"
	r:= self regleAEvalueWithRuleBase: regles_active.
	self currentRule: r. "on stock la regle courante dans l'objet"
	Transcript show: 'Règle sélectionnée pour évaluation : ', r condition printString , ' - ',r action printString; cr.
	
	"On l'évalue"
	b:= r evalue: (factBase) . 
	Transcript show: 'Résultat de l''évaluation : ', b printString; cr.
	
	"On met à jour la liste des règles actives "
	regles_active := self selectionneReglesActives. ].
	Transcript show: 'Règles actives mises à jour : ', regles_active size printString; cr.
	^self.
]

{ #category : #'as yet unclassified' }
InferenceEngine >> runAStepWithValue: aValue [
	| regles_active |
	
	"on evalue la regle courante."
	self currentRule evalueFB: factBase andValue: aValue .
	
	" on evalue la condition d'arret." 
	regles_active := self selectionneReglesActives.
	((regles_active isEmpty) or: ((self factBase children size) = 1))
		
		ifFalse: " attention s'arreter si 1 enfant"
			"On choisi la nouvelle regle courante."
			"On récupère une regle a evaluer parmis les actives (suivant son poids)"
			[ self currentRule: (self regleAEvalueWithRuleBase: regles_active) ]
		
		ifTrue: [ self currentRule: nil ].
	
	self changed.
	^self.
]

{ #category : #'as yet unclassified' }
InferenceEngine >> selectionneReglesActives [
	^self ruleBase rules select: [ :each | each enable   ].

]

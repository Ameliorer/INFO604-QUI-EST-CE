Class {
	#name : #InferenceEngine,
	#superclass : #Object,
	#instVars : [
		'factBase',
		'ruleBase'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #examples }
InferenceEngine class >> example [ 
^self new 
	factBase: FactBase example ;
	ruleBase: RuleBase example ;
	yourself 
]

{ #category : #accessing }
InferenceEngine >> factBase [

	^ factBase
]

{ #category : #accessing }
InferenceEngine >> factBase: anObject [

	factBase := anObject
]

{ #category : #initialization }
InferenceEngine >> initialize [ 
ruleBase := RuleBase new.
factBase := FactBase new.

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

	ruleBase := anObject
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
InferenceEngine >> selectionneReglesActives [
	^self ruleBase rules select: [ :each | each enable   ].

]

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
InferenceEngine >> regle_a_evalue [
	| regle_courante |
	regle_courante := (self ruleBase) first.
	self ruleBase do: [ :each | regle_courante := regle_courante max: each ].
	^ regle_courante 
]

{ #category : #'as yet unclassified' }
InferenceEngine >> regle_a_evalueWithRuleBase: aRuleBase [
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
	regles_active := self selectionne_regles_actives.
	[regles_active isEmpty] whileFalse: 

[ |r| 
	"On récupère une regle a evaluer parmis les actives (suivant son poids)"
	r:= self regle_a_evalueWithRuleBase: regles_active. 
	"On l'évalue"
	r value:self factBase . 
	"On met à jour la liste des règles actives "
	regles_active := self selectionne_regles_actives. ].
	^self.
]

{ #category : #'as yet unclassified' }
InferenceEngine >> selectionne_regles_actives [
	| regles_active |
	regles_active := OrderedCollection new.
	self ruleBase rules do: [ :each | (each enable ) ifTrue: [ regles_active add: each ] ].
	^ regles_active
]

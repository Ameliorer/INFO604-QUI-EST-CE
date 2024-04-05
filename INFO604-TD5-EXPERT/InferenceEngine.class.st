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

{ #category : #accessing }
InferenceEngine >> ruleBase [

	^ ruleBase
]

{ #category : #accessing }
InferenceEngine >> ruleBase: anObject [

	ruleBase := anObject
]

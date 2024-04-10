Class {
	#name : #FactBase,
	#superclass : #Object,
	#instVars : [
		'facts'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #examples }
FactBase class >> example [ 
	| fb |
	fb := self new.
	fb add: (Fact newWithName: 'Jeanne' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Hugo' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Agathe' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Arthur' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Leo' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Sophie' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Tom' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Madi' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Lucile' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Suzie' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Imane' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Melissa' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Paul' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Gaspard' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Lou' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Ines' andType: 'Enfant' andValue: 'true').
	fb add: (Fact newWithName: 'Couvre-chef' andType: 'Caracteristique' andValue: 'nil').
	fb add: (Fact newWithName: 'Lunettes' andType: 'Caracteristique' andValue: 'nil').
	fb add: (Fact newWithName: 'Yeux-fermés' andType: 'Caracteristique' andValue: 'nil').
	fb add: (Fact newWithName: 'Bouche-ouverte' andType: 'Caracteristique' andValue: 'nil').
	fb add: (Fact newWithName: 'Tache-rousseur' andType: 'Caracteristique' andValue: 'nil').
	fb add: (Fact newWithName: 'Brun' andType: 'Caracteristique' andValue: 'nil').
	fb add: (Fact newWithName: 'Roux' andType: 'Caracteristique' andValue: 'nil').
	fb add: (Fact newWithName: 'Fille' andType: 'Caracteristique' andValue: 'nil').
	^fb 
]

{ #category : #adding }
FactBase >> add: aFact [
	facts add: aFact.
]

{ #category : #accessing }
FactBase >> at: aName [
^(facts select: [ :each | aName = each name ]) at: 1
]

{ #category : #accessing }
FactBase >> at: aName put: aValue [
| f |
f := self at: aName.
f value: aValue.
^self
]

{ #category : #'as yet unclassified' }
FactBase >> characteristic [
	^facts select: [ :each | each isCharacteristic ]

]

{ #category : #'as yet unclassified' }
FactBase >> children [
	^facts select: [ :each | each isChild]

]

{ #category : #'as yet unclassified' }
FactBase >> enleve: aNameFact [
	facts removeAllSuchThat: [ :each | each name = aNameFact ].
	^self
]

{ #category : #'as yet unclassified' }
FactBase >> enleveTab: aTabOfKeyFact [
	aTabOfKeyFact do: [ :each | self enleve: each ].
	^self
]

{ #category : #accessing }
FactBase >> facts [

	^ facts
]

{ #category : #accessing }
FactBase >> facts: anObject [

	facts := anObject
]

{ #category : #testing }
FactBase >> has: aName [
"voir si on a la clé de disponible dans le dictionnaire"
^(facts select: [ :each | aName = each name ]) isNotEmpty.
]

{ #category : #initialization }
FactBase >> initialize [ 
	super initialize.
	facts := OrderedCollection new.
]

{ #category : #printing }
FactBase >> printOn: aStream [
	(self facts isEmpty)
		ifTrue: [aStream nextPutAll: 'Aucun enfant ne correspond a votre recherche' ; cr ]
		ifFalse:[self facts do: [ :each | aStream print: each ; cr ]]

]

{ #category : #accessing }
FactBase >> valueAt: aName [
^((facts select: [ :each | aName = each name ]) at: 1) value1
]

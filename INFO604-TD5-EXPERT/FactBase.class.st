Class {
	#name : #FactBase,
	#superclass : #Dictionary,
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #examples }
FactBase class >> example [ 
^self new 
	at: 'Jeanne' put: true;
	at: 'Hugo' put: true;
	at: 'Agathe' put: true;
	at: 'Arthur' put: true;
	at: 'Leo' put: true;
	at: 'Sophie' put: true;
	at: 'Tom' put: true;
	at: 'Madi' put: true;	
	at: 'Lucile' put: true;
	at: 'Suzie' put: true;
	at: 'Imane' put: true;
	at: 'Melissa' put: true;
	at: 'Paul' put: true;
	at: 'Gaspard' put: true;
	at: 'Lou' put: true;
	at: 'Ines' put: true;
	at: 'Couvre-chef' put: nil;
	at: 'Lunettes' put: nil;
	at: 'Yeux-fermés' put: nil;
	at: 'Bouche-ouverte' put: nil;
	at: 'Tache-rousseur' put: nil;
	at: 'Brun' put: nil;
	at: 'Roux' put: nil;
	at: 'Fille' put: nil;
	yourself 
]

{ #category : #accessing }
FactBase >> at: key [
^self at: key ifAbsent: [ nil ]
]

{ #category : #'as yet unclassified' }
FactBase >> enleve: aKeyFact [
	self at: aKeyFact put: false.
	^self
]

{ #category : #'as yet unclassified' }
FactBase >> enleveTab: aTabOfKeyFact [
	aTabOfKeyFact do: [ :each | self at: each put: false ].
	^self
]

{ #category : #testing }
FactBase >> has: key [
"voir si on a la clé de disponible dans le dictionnaire"
^self includesKey: key.
]

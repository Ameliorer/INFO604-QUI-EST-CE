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
	at: 'Couvre-chef' put: true;
	yourself 
]

{ #category : #accessing }
FactBase >> at: key [
^self at: key ifAbsent: [ nil ]
]

{ #category : #testing }
FactBase >> has: key [
"voir si on a la clé de disponible dans le dictionnaire"
^self includesKey: key.
]

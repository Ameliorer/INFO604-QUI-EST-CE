"
La base de règles.
"
Class {
	#name : #RuleBase,
	#superclass : #Object,
	#instVars : [
		'rules'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #examples }
RuleBase class >> example [ 
^self new 

	add: (Rule newWithCondition: 
		[ :fb | (fb valueAt: 'Couvre-chef') isNil ] 
		andAction: [ :fb | fb at: 'Couvre-chef' put: (SpConfirmDialog new label: 'Est-ce que j''ai un couvre-chef ?' ; openModal ). 
			(fb valueAt: 'Couvre-chef') 
				ifTrue: [fb enleveTab: #('Hugo' 'Arthur' 'Tom' 'Lucile' 'Suzie' 'Madi' 'Imane' 'Paul' 'Lou' 'Sophie' )] 
				ifFalse: [fb enleveTab:  #('Jeanne' 'Agathe' 'Leo' 'Melissa' 'Gaspard' 'Ines')]]);



add: (Rule newWithCondition: [ :fb | (fb valueAt: 'Lunettes') isNil ] andAction: [ :fb | fb at: 'Lunettes' put: (SpConfirmDialog new label: 'Est-ce que j''ai des lunettes ?' ; openModal ). (fb valueAt: 'Lunettes') ifTrue: [fb enleveTab: #('Jeanne' 'Hugo' 'Agathe' 'Arthur' 'Leo' 'Tom' 'Lucile' 'Suzie' 'Madi' 'Imane' 'Melissa' 'Paul' 'Gaspard' 'Lou' 'Ines' )] ifFalse: [fb enleveTab:  #('Sophie')]]);

add: (Rule newWithCondition: [ :fb | (fb valueAt: 'Yeux-fermés') isNil ] andAction: [ :fb | fb at: 'Yeux-fermés' put: (SpConfirmDialog new label: 'Est-ce que j''ai les yeux fermés ?' ; openModal ). (fb valueAt: 'Yeux-fermés') ifTrue: [fb enleveTab: #('Jeanne' 'Hugo' 'Arthur' 'Leo' 'Tom' 'Madi' 'Suzie' 'Imane' 'Paul' 'Lou' 'Ines' 'Sophie' )] ifFalse: [fb enleveTab:  #('Agathe' 'Lucile' 'Melissa' 'Gaspard')]]);

add: (Rule newWithCondition: [ :fb | (fb valueAt: 'Bouche-ouverte') isNil ] andAction: [ :fb | fb at: 'Bouche-ouverte' put: (SpConfirmDialog new label: 'Est-ce que j''ai la bouche ouverte ?' ; openModal ). (fb valueAt: 'Bouche-ouverte') ifTrue: [fb enleveTab: #('Jeanne' 'Hugo' 'Agathe' 'Arthur' 'Leo' 'Tom' 'Suzie' 'Imane' 'Melissa' 'Paul' 'Gaspard' 'Lou' 'Ines' 'Sophie' )] ifFalse: [fb enleveTab:  #('Madi' 'Lucile' )]]);

add: (Rule newWithCondition: [ :fb | (fb valueAt: 'Tache-rousseur') isNil ] andAction: [ :fb | fb at: 'Tache-rousseur' put: (SpConfirmDialog new label: 'Est-ce que j''ai des taches de rousseur ?' ; openModal ). (fb valueAt: 'Tache-rousseur') ifTrue: [fb enleveTab: #('Jeanne' 'Hugo' 'Agathe' 'Leo' 'Lucile' 'Suzie' 'Madi' 'Melissa' 'Paul' 'Gaspard' 'Lou' 'Ines' 'Sophie' )] ifFalse: [fb enleveTab:  #('Arthur' 'Tom' 'Imane' )]]);

add: (Rule newWithCondition: [ :fb | (fb valueAt: 'Brun') isNil ] andAction: [ :fb | fb at: 'Brun' put: (SpConfirmDialog new label: 'Est-ce que j''ai les cheveux bruns ?' ; openModal ). (fb valueAt: 'Brun') ifTrue: [fb enleveTab: #('Jeanne' 'Hugo' 'Agathe' 'Arthur' 'Tom' 'Lucile' 'Melissa' 'Paul' 'Gaspard' 'Lou' 'Ines' 'Sophie' )] ifFalse: [fb enleveTab:  #('Leo' 'Madi' 'Suzie' 'Imane')]]);

add: (Rule newWithCondition: [ :fb | (fb valueAt: 'Roux') isNil ] andAction: [ :fb | fb at: 'Roux' put: (SpConfirmDialog new label: 'Est-ce que j''ai les cheveux roux ?' ; openModal ). (fb valueAt: 'Roux') ifTrue: [fb enleveTab: #('Hugo' 'Agathe' 'Arthur' 'Melissa' 'Gaspard' 'Lou' 'Ines' 'Sophie' 'Leo' 'Madi' 'Suzie' 'Imane')] ifFalse: [fb enleveTab:  #('Jeanne' 'Tom' 'Lucile' 'Paul' )]]);

add: (Rule newWithCondition: [ :fb | (fb valueAt: 'Fille') isNil ] andAction: [ :fb | fb at: 'Fille' put: (SpConfirmDialog new label: 'Est-ce que je suis une fille ?' ; openModal ). (fb valueAt: 'Fille') ifTrue: [fb enleveTab: #('Hugo' 'Arthur' 'Tom' 'Paul' 'Gaspard' 'Leo' 'Madi' )] ifFalse: [fb enleveTab:  #('Suzie' 'Imane' 'Lou' 'Ines' 'Sophie' 'Lucile' 'Melissa' 'Agathe' 'Jeanne')]]);

yourself.
]

{ #category : #adding }
RuleBase >> add: aRule [
"pour ajouter une regle dans la base"
rules add: aRule. "le add de ordered collection, il ajoute a la fin"
]

{ #category : #initialization }
RuleBase >> initialize [ 
super initialize .
rules := OrderedCollection new. "C'est une liste de regles"

]

{ #category : #initialization }
RuleBase >> reset [ 
"remettre a zero la base de regles. Pour ça on parcours toutes les regles et on met enable a true."
"pour ça on les parcours toutes."
rules do: [ :each | each enable: true ]


]

{ #category : #accessing }
RuleBase >> rules [

	^ rules
]

{ #category : #accessing }
RuleBase >> rules: anObject [

	rules := anObject
]

{ #category : #enumerating }
RuleBase >> select: aBlock [
"fait le select: de orderedCollection"
"evalue chaque regles et si elles sont vraies, elles sont ajoutées a une nouvelle liste"

"on crée un bloc intermediaire et on regarde si chaque regle est evaluable dans le bloc donné en parametre"
^rules select: [ :each | each enable &  aBlock value: each]

"si on enleve 'each enable &' de la ligne d'au dessus, déjà on devra le mettre dans aBlock, mais c'est comme si on faisait 'rules select: aBlock'"
]

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
	add: (Rule newWithCondition: [ :fb | (fb at: 'Couvre-chef') = false ] andAction: [ :fb | fb at: 'Couvre-chef' put: (SpConfirmDialog new label: 'Est-ce que j''ai un couvre-chef ?' ; openModal ) ] );
	yourself 
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

{ #category : #enumerating }
RuleBase >> select: aBlock [
"fait le select: de orderedCollection"
"evalue chaque regles et si elles sont vraies, elles sont ajoutées a une nouvelle liste"

"on crée un bloc intermediaire et on regarde si chaque regle est evaluable dans le bloc donné en parametre"
^rules select: [ :each | each enable &  aBlock value: each]

"si on enleve 'each enable &' de la ligne d'au dessus, déjà on devra le mettre dans aBlock, mais c'est comme si on faisait 'rules select: aBlock'"
]

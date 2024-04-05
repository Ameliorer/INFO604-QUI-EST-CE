"
Instance Variables
action:		<Object>  l'action de la regle 
condition:		<Object> la condition pour faire l'action de la regle
enable:		<Object> si la regle a déjà été faite
name:		<Object> son nom
"
Class {
	#name : #Rule,
	#superclass : #Object,
	#instVars : [
		'condition',
		'action',
		'enable',
		'name'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #'instance creation' }
Rule class >> newWithCondition: aConditionBlock andAction: aActionBlock [
| r | ""
r := self new.
r condition: aConditionBlock.
r action: aActionBlock.
^r
]

{ #category : #accessing }
Rule >> action [

	^ action
]

{ #category : #accessing }
Rule >> action: anObject [

	action := anObject
]

{ #category : #accessing }
Rule >> condition [

	^ condition
]

{ #category : #accessing }
Rule >> condition: anObject [

	condition := anObject
]

{ #category : #accessing }
Rule >> enable [

	^ enable
]

{ #category : #accessing }
Rule >> enable: anObject [

	enable := anObject
]

{ #category : #initialization }
Rule >> initialize [ 
super initialize .
name := 'Règle'.
condition := BlockClosure new.   "bloc vide, un bloc a évalué"
action := BlockClosure new.
enable := true
]

{ #category : #accessing }
Rule >> name [

	^ name
]

{ #category : #accessing }
Rule >> name: anObject [

	name := anObject
]

{ #category : #initialization }
Rule >> value: aFactBase [
"si on l'a déja fait ou si la condition est fausse"
enable & ( condition value: aFactBase ) ifFalse: [ ^self ]. "Si c'est faux, on s'arrete direct"
enable := false.
^action value: aFactBase.



]

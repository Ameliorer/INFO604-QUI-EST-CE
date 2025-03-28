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
	#traits : 'TComparable',
	#classTraits : 'TComparable classTrait',
	#instVars : [
		'condition',
		'action',
		'enable',
		'name',
		'poids'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #'instance creation' }
Rule class >> newWithCondition: aConditionBlock andAction: aActionBlock [
^ self newWithCondition: aConditionBlock andAction: aActionBlock andPoids: 1.
]

{ #category : #'instance creation' }
Rule class >> newWithCondition: aConditionBlock andAction: aActionBlock andName: aName [
^ self newWithCondition: aConditionBlock andAction: aActionBlock andPoids: 1 andName: aName.
]

{ #category : #'instance creation' }
Rule class >> newWithCondition: aConditionBlock andAction: aActionBlock andPoids: aPoidsValue [
| r | ""
r := self new.
r condition: aConditionBlock.
r action: aActionBlock.
r poids: aPoidsValue.
^r
]

{ #category : #'instance creation' }
Rule class >> newWithCondition: aConditionBlock andAction: aActionBlock andPoids: aPoidsValue andName: aName [
| r | ""
r := self new.
r condition: aConditionBlock.
r action: aActionBlock.
r poids: aPoidsValue.
r name: aName.
^r
]

{ #category : #comparing }
Rule >> < aComparable [
	"Answer whether the receiver is less than the argument."
	^self poids < aComparable poids
]

{ #category : #comparing }
Rule >> = aComparable [
	"Compare the receiver with the argument and answer with true if the
	receiver is equal to the argument. Otherwise answer false."
	^self name = aComparable name
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
Rule >> evalue: aFactBase [
"si on l'a déja fait ou si la condition est fausse"
enable & ( condition value: aFactBase ) ifFalse: [ ^self ]. "Si c'est faux, on s'arrete direct"
self enable: false.
^self action value: aFactBase.




]

{ #category : #initialization }
Rule >> evalueFB: aFactBase andValue: aValue [
"si on l'a déja fait ou si la condition est fausse"
enable & ( condition value: aFactBase ) ifFalse: [ ^self ]. "Si c'est faux, on s'arrete direct"
self enable: false.
^self action value: aFactBase value: aValue .




]

{ #category : #initialization }
Rule >> initialize [ 
super initialize .
name := 'Règle'.
condition := BlockClosure new.   "bloc vide, un bloc a évalué"
action := BlockClosure new.
enable := true.
poids := 0.

]

{ #category : #accessing }
Rule >> name [

	^ name
]

{ #category : #accessing }
Rule >> name: anObject [

	name := anObject
]

{ #category : #accessing }
Rule >> poids [

	^ poids
]

{ #category : #accessing }
Rule >> poids: anObject [

	poids := anObject
]

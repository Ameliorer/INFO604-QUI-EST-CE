Class {
	#name : #Fact,
	#superclass : #Object,
	#traits : 'TComparable',
	#classTraits : 'TComparable classTrait',
	#instVars : [
		'name',
		'type',
		'value'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #'instance creation' }
Fact class >> newWithName: aName andType: aType andValue: aValue [
	| f | ""
	f := self new.
	f name: aName.
	f type: aType.
	f value: aValue.
	^f
]

{ #category : #testing }
Fact >> isCharacteristic [
	^'Caracteristique' = self type

]

{ #category : #testing }
Fact >> isChild [
	^'Enfant' = self type

]

{ #category : #accessing }
Fact >> name [

	^ name
]

{ #category : #accessing }
Fact >> name: anObject [

	name := anObject
]

{ #category : #printing }
Fact >> printOn: aStream [
	aStream nextPutAll: name; cr.
]

{ #category : #accessing }
Fact >> type [

	^ type
]

{ #category : #accessing }
Fact >> type: anObject [

	type := anObject
]

{ #category : #accessing }
Fact >> value1 [
	^ value
]

{ #category : #accessing }
Fact >> value: anObject [

	value := anObject
]

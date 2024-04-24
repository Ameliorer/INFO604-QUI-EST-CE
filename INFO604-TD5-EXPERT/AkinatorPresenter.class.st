Class {
	#name : #AkinatorPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inferenceEngine',
		'questionLabel',
		'listeEnfantsLabel',
		'titreListeEnfantsLabel',
		'trueButton',
		'falseButton',
		'dontKnowButton',
		'image'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #initialization }
AkinatorPresenter >> connectPresenters [ 
	trueButton action: [ self inferenceEngine runAStepWithValue: true. self dealWithFinish ].
	falseButton action: [ self inferenceEngine runAStepWithValue: false. self dealWithFinish ].
	dontKnowButton action: [ self inferenceEngine runAStepWithValue: nil. self dealWithFinish ]
]

{ #category : #'as yet unclassified' }
AkinatorPresenter >> dealWithFinish [
	((self inferenceEngine currentRule isNil ) or: (self inferenceEngine factBase children isEmpty))
		ifTrue: [ self layout remove: self layout presenters second.]
]

{ #category : #'as yet unclassified' }
AkinatorPresenter >> defaultLayout [
	| buttons |
	buttons := SpBoxLayout newHorizontal spacing: 10.
	buttons add: falseButton.
	buttons add: trueButton.
	buttons add: dontKnowButton.

	^SpBoxLayout newVertical 
		spacing: 30;
		add: questionLabel expand: false;
		add: buttons expand: false;
		add: titreListeEnfantsLabel expand: false;
		add: listeEnfantsLabel expand: false;
		add: image expand: false;
		yourself 
		
]

{ #category : #accessing }
AkinatorPresenter >> falseButton [

	^ falseButton
]

{ #category : #accessing }
AkinatorPresenter >> falseButton: anObject [

	falseButton := anObject
]

{ #category : #accessing }
AkinatorPresenter >> inferenceEngine [

	^ inferenceEngine
]

{ #category : #accessing }
AkinatorPresenter >> inferenceEngine: anObject [

	inferenceEngine := anObject
]

{ #category : #'initialization - deprecated' }
AkinatorPresenter >> initializePresenter [
	super initializePresenter.
	
	inferenceEngine := InferenceEngine example.
	
	questionLabel := self newLabel.
	questionLabel label: self inferenceEngine currentRule name.
	self inferenceEngine addDependent: questionLabel.
	
	listeEnfantsLabel := self newLabel.
	listeEnfantsLabel label: ( inferenceEngine factBase printString ).
	self inferenceEngine factBase addDependent: listeEnfantsLabel .
	
	titreListeEnfantsLabel := self newLabel.
	titreListeEnfantsLabel label: 'Liste des enfants possibles :'.
	
	trueButton := self newButton.
	trueButton label: 'Oui'.
	
	falseButton := self newButton.
	falseButton label: 'Non'.
	
	dontKnowButton := self newButton.
	dontKnowButton label: 'Je ne sais pas'.
	
	image := self newImage.
	image image: (ImageReadWriter formFromFileNamed:'children.png' ).
]

{ #category : #initialization }
AkinatorPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Akinator';
		initialExtent: 600@350
]

{ #category : #accessing }
AkinatorPresenter >> listeEnfantsLabel [

	^ listeEnfantsLabel
]

{ #category : #accessing }
AkinatorPresenter >> listeEnfantsLabel: anObject [

	listeEnfantsLabel := anObject
]

{ #category : #accessing }
AkinatorPresenter >> questionLabel [

	^ questionLabel
]

{ #category : #accessing }
AkinatorPresenter >> questionLabel: anObject [

	questionLabel := anObject
]

{ #category : #accessing }
AkinatorPresenter >> titreListeEnfantsLabel [

	^ titreListeEnfantsLabel
]

{ #category : #accessing }
AkinatorPresenter >> titreListeEnfantsLabel: anObject [

	titreListeEnfantsLabel := anObject
]

{ #category : #accessing }
AkinatorPresenter >> trueButton [

	^ trueButton
]

{ #category : #accessing }
AkinatorPresenter >> trueButton: anObject [

	trueButton := anObject
]

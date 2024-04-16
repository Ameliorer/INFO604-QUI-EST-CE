Class {
	#name : #AkinatorPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inferenceEngine',
		'questionLabel',
		'listeEnfantsLabel',
		'titreListeEnfantsLabel',
		'trueButton',
		'falseButton'
	],
	#category : #'INFO604-TD5-EXPERT'
}

{ #category : #initialization }
AkinatorPresenter >> connectPresenters [ 
	trueButton action: [ self inferenceEngine runAStepWithValue: true. self dealWithFinish ].
	falseButton action: [ self inferenceEngine runAStepWithValue: false. self dealWithFinish ]
]

{ #category : #'as yet unclassified' }
AkinatorPresenter >> dealWithFinish [
	(self inferenceEngine currentRule)
		ifNil: [ self layout remove: self layout presenters second. "self layout remove: self layout presenters third" ]
]

{ #category : #layout }
AkinatorPresenter >> defaultLayout [
	| buttons |
	buttons := SpBoxLayout newHorizontal.
	buttons add: falseButton.
	buttons add: trueButton.

	^SpBoxLayout newVertical 
		add: questionLabel;
		add: buttons ;
		add: titreListeEnfantsLabel;
		add: listeEnfantsLabel;
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
	falseButton label: 'Non'
]

{ #category : #initialization }
AkinatorPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Akinator';
		initialExtent: 500@500
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

Extension { #name : #SpLabelPresenter }

{ #category : #'*INFO604-TD5-EXPERT' }
SpLabelPresenter >> update: anObject [
	
	super update: anObject.
	self label: anObject printString.
	
]

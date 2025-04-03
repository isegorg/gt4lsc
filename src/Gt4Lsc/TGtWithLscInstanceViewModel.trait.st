Trait {
	#name : #TGtWithLscInstanceViewModel,
	#instVars : [
		'lscInstanceViewModel'
	],
	#category : #'Gt4Lsc-! Views'
}

{ #category : #'api - lsc instance view model' }
TGtWithLscInstanceViewModel >> hasLscInstanceViewModel [
	"Return a true if Lsc instance view model is assigned to the receiver element, false otherwise"
	<return: #Boolean>

	^ lscInstanceViewModel notNil
]

{ #category : #'api - lsc instance view model' }
TGtWithLscInstanceViewModel >> lscInstanceViewModel [
	"Return a not-null Lsc instance view model assigned to the receiver element"
	self
		assert: [ lscInstanceViewModel notNil ]
		description: [ 'Lsc instance view model should be initialized' ].

	^ lscInstanceViewModel
]

{ #category : #'api - lsc instance view model' }
TGtWithLscInstanceViewModel >> lscInstanceViewModel: aLscInstanceViewModel [
	"Set a not-null Lsc instance view model assigned to the receiver element"
	self
		assert: [ aLscInstanceViewModel notNil ]
		description: [ 'Lsc instance view model must not be nil' ].

	lscInstanceViewModel == aLscInstanceViewModel 
		ifTrue: [ ^ self ].

	lscInstanceViewModel ifNotNil: [ self unsubscribeFromLscInstanceViewModel ].
	lscInstanceViewModel := aLscInstanceViewModel.

	self onLscInstanceViewModelChanged.
	self subscribeToLscInstanceViewModel
]

{ #category : #'api - lsc instance view model' }
TGtWithLscInstanceViewModel >> onLscInstanceViewModelChanged [
	"Is sent when a new Lsc instance view model is assigned to the element"
	
	self explicitRequirement
]

{ #category : #'api - lsc instance view model' }
TGtWithLscInstanceViewModel >> subscribeToLscInstanceViewModel [
	"Is sent after a new Lsc instance view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromLscInstanceViewModel if elements subscribe to them"
]

{ #category : #'api - lsc instance view model' }
TGtWithLscInstanceViewModel >> unsubscribeFromLscInstanceViewModel [
	"Is sent before a new Lsc instance view model is assigned to the element.
	Elements that subscribe to Lsc instance view model in domain model are required to implement this methods"
]

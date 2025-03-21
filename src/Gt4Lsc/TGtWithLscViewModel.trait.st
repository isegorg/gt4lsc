Trait {
	#name : #TGtWithLscViewModel,
	#instVars : [
		'lscViewModel'
	],
	#category : #'Gt4Lsc-! Views'
}

{ #category : #'api - lsc view model' }
TGtWithLscViewModel >> hasLscViewModel [
	"Return a true if Lsc view model is assigned to the receiver element, false otherwise"
	<return: #Boolean>

	^ lscViewModel notNil
]

{ #category : #'api - lsc view model' }
TGtWithLscViewModel >> lscViewModel [
	"Return a not-null Lsc view model assigned to the receiver element"
	self
		assert: [ self hasLscViewModel ]
		description: [ 'Lsc view model should be initialized' ].

	^ lscViewModel
]

{ #category : #'api - lsc view model' }
TGtWithLscViewModel >> lscViewModel: aLscViewModel [
	"Set a not-null Lsc view model assigned to the receiver element"
	self
		assert: [ aLscViewModel notNil ]
		description: [ 'Lsc view model must not be nil' ].

	lscViewModel == aLscViewModel 
		ifTrue: [ ^ self ].

	lscViewModel ifNotNil: [ self unsubscribeFromLscViewModel ].
	lscViewModel := aLscViewModel.

	self onLscViewModelChanged.
	self subscribeToLscViewModel
]

{ #category : #'api - lsc view model' }
TGtWithLscViewModel >> onLscViewModelChanged [
	"Is sent when a new Lsc view model is assigned to the element"
	
	self explicitRequirement
]

{ #category : #'api - lsc view model' }
TGtWithLscViewModel >> subscribeToLscViewModel [
	"Is sent after a new Lsc view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromLscViewModel if elements subscribe to them"
]

{ #category : #'api - lsc view model' }
TGtWithLscViewModel >> unsubscribeFromLscViewModel [
	"Is sent before a new Lsc view model is assigned to the element.
	Elements that subscribe to Lsc view model in domain model are required to implement this methods"
]

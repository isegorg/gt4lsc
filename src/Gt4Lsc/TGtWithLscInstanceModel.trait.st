Trait {
	#name : #TGtWithLscInstanceModel,
	#instVars : [
		'lscInstanceModel'
	],
	#category : #'Gt4Lsc-! View models'
}

{ #category : #'api - lsc instance model' }
TGtWithLscInstanceModel >> hasLscInstanceModel [
	"Return a true if lsc instance model is assigned to the receiver, false otherwise"
	<return: #Boolean>

	^ lscInstanceModel notNil
]

{ #category : #'api - lsc instance model' }
TGtWithLscInstanceModel >> lscInstanceModel [
	"Return a not-null lsc instance model assigned to the receiver view model"
	self
		assert: [ self hasLscInstanceModel ]
		description: [ 'lsc instance model should be initialized' ].
		
	^ lscInstanceModel
]

{ #category : #'api - lsc instance model' }
TGtWithLscInstanceModel >> lscInstanceModel: aLscInstanceModel [
	"Set a not-null lsc instance domain model assigned to the receiver view model"
	self
		assert: [ aLscInstanceModel notNil ]
		description: [ 'lsc instance model must not be nil' ].

	lscInstanceModel == aLscInstanceModel 
		ifTrue: [ ^ self ].

	lscInstanceModel ifNotNil: [ self unsubscribeFromLscInstanceModel ].
	lscInstanceModel := aLscInstanceModel.

	self onLscInstanceModelChanged.
	self subscribeToLscInstanceModel
]

{ #category : #'api - lsc instance model' }
TGtWithLscInstanceModel >> onLscInstanceModelChanged [
	"Is sent when a new lsc instance model is assigned to the view model"
	
	self explicitRequirement
]

{ #category : #'api - lsc instance model' }
TGtWithLscInstanceModel >> subscribeToLscInstanceModel [
	"Is sent after a new lsc instance model is assigned to the view model.
	It is required to unsubscribe from the domain model by implementing
	#unsubscribeFromLscInstanceModel if view model subscribes to them"
]

{ #category : #'api - lsc instance model' }
TGtWithLscInstanceModel >> unsubscribeFromLscInstanceModel [
	"Is sent before a new lsc instance model is assigned to the view model.
	View models that subscribe to lsc instance model are required to implement this methods"
]

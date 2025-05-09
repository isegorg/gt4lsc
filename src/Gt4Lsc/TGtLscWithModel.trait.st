Trait {
	#name : #TGtLscWithModel,
	#instVars : [
		'model'
	],
	#category : #'Gt4Lsc-! Views'
}

{ #category : #'api - model' }
TGtLscWithModel >> hasModel [
	"Return a true if model is assigned to the receiver, false otherwise"
	<return: #Boolean>

	^ model notNil
]

{ #category : #'api - model' }
TGtLscWithModel >> model [
	"Return a not-null model assigned to the receiver view model"
	self
		assert: [ self hasModel ]
		description: [ 'model should be initialized' ].
		
	^ model
]

{ #category : #'api - model' }
TGtLscWithModel >> model: aModel [
	"Set a not-null model assigned to the receiver view model"
	self
		assert: [ aModel notNil ]
		description: [ 'model must not be nil' ].

	model == aModel 
		ifTrue: [ ^ self ].

	model ifNotNil: [ self unsubscribeFromModel ].
	model := aModel.

	self onModelChanged.
	self subscribeToModel
]

{ #category : #'api - model' }
TGtLscWithModel >> onModelChanged [
	"Is sent when a new model is assigned to the receiver"
	
	self explicitRequirement
]

{ #category : #'api - model' }
TGtLscWithModel >> subscribeToModel [
	"Is sent after a new model is assigned to the receiver.
	It is required to unsubscribe from the model by implementing
	#unsubscribeFromModel if receiver subscribes to them"
]

{ #category : #'api - model' }
TGtLscWithModel >> unsubscribeFromModel [
	"Is sent before a new model is assigned to the receiver.
	Receivers that subscribe to model are required to implement this methods"
]

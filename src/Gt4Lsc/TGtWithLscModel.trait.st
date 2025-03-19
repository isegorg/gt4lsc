Trait {
	#name : #TGtWithLscModel,
	#instVars : [
		'lscModel'
	],
	#category : #'Gt4Lsc-! View models'
}

{ #category : #'api - lsc model' }
TGtWithLscModel >> hasLscModel [
	"Return a true if lsc model is assigned to the receiver, false otherwise"
	<return: #Boolean>

	^ lscModel notNil
]

{ #category : #'api - lsc model' }
TGtWithLscModel >> lscModel [
	"Return a not-null lsc model assigned to the receiver view model"
	self
		assert: [ self hasLscModel ]
		description: [ 'lsc model should be initialized' ].
		
	^ lscModel
]

{ #category : #'api - lsc model' }
TGtWithLscModel >> lscModel: aLscModel [
	"Set a not-null lsc domain model assigned to the receiver view model"
	self
		assert: [ aLscModel notNil ]
		description: [ 'lsc model must not be nil' ].

	lscModel == aLscModel 
		ifTrue: [ ^ self ].

	lscModel ifNotNil: [ self unsubscribeFromWardleyMapModel ].
	lscModel := aLscModel.

	self onWardleyMapModelChanged.
	self subscribeToWardleyMapModel
]

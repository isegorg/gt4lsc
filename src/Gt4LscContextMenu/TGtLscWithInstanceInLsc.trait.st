Trait {
	#name : #TGtLscWithInstanceInLsc,
	#instVars : [
		'lscInstanceModel'
	],
	#traits : 'TGtLscWithModel',
	#classTraits : 'TGtLscWithModel classTrait',
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'instance creation' }
TGtLscWithInstanceInLsc classSide >> forInstance: aGtLscInstanceModel inLsc: aGtLscModel [
	^ self basicNew initialize
		lscInstance: aGtLscInstanceModel inLsc: aGtLscModel;
		yourself
]

{ #category : #'instance creation' }
TGtLscWithInstanceInLsc classSide >> new [
	self error: 'Use #forInstance:inLsc:'
]

{ #category : #checking }
TGtLscWithInstanceInLsc >> checkInstance: aGtLscInstanceModel isInLsc: aGtLscModel [
	self
		assert: (aGtLscModel hasInstance: aGtLscInstanceModel)
		description: 'Lsc Instance must be in the Lsc'
]

{ #category : #'instance creation' }
TGtLscWithInstanceInLsc >> lscInstance: aGtLscInstanceModel inLsc: aGtLscModel [
	self checkInstance: aGtLscInstanceModel isInLsc: aGtLscModel.
	lscInstanceModel := aGtLscInstanceModel.
	self model: aGtLscModel
]

{ #category : #'api - model' }
TGtLscWithInstanceInLsc >> onModelChanged [
	"Is sent when a new model is assigned to the receiver"
	
	"The model (lsc) can not be changed to another if lsc instance is not in it"
	self checkInstance: lscInstanceModel isInLsc: model.
]

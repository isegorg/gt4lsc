Class {
	#name : #GtLscMoveInstanceButtonMenuItem,
	#superclass : #GtLscButtonMenuItem,
	#traits : 'TGtLscWithInstanceInLsc + TGtLscMenuItemWithAptitude + TGtLscMenuItemWithLabel + TGtLscMenuItemWithIcon + TGtLscMenuItemWithVisibility',
	#classTraits : 'TGtLscWithInstanceInLsc classTrait + TGtLscMenuItemWithAptitude classTrait + TGtLscMenuItemWithLabel classTrait + TGtLscMenuItemWithIcon classTrait + TGtLscMenuItemWithVisibility classTrait',
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'default values' }
GtLscMoveInstanceButtonMenuItem class >> defaultAptitudes [
	"overwrite with the aptitudes initialization value"
	^ BrGlamorousButtonWithIconAptitude
]

{ #category : #checking }
GtLscMoveInstanceButtonMenuItem >> checkVisibilityCondition [
	<return: #Bollean>
	"Return true it must be visible or false in other case"
]

{ #category : #'events handling' }
GtLscMoveInstanceButtonMenuItem >> onInstancePositionsChanged [
	"If not visible, dont participate on layout"
	self
		visibility: (self checkVisibilityCondition
				ifTrue: [ BlVisibility visible ]
				ifFalse: [ BlVisibility gone ])
]

{ #category : #'events handling' }
GtLscMoveInstanceButtonMenuItem >> onLscInstanceRemoved [
	self visibility: BlVisibility gone.
	self unsubscribeFromModel
]

{ #category : #'api - model' }
GtLscMoveInstanceButtonMenuItem >> onModelChanged [
	"Is sent when a new model is assigned to the receiver"
	
	"The model (lsc) can not be changed to another if lsc instance is not in it"
	self checkInstance: lscInstanceModel isInLsc: model.
	self onInstancePositionsChanged
]

{ #category : #'api - model' }
GtLscMoveInstanceButtonMenuItem >> subscribeToModel [
	"Is sent after a new model is assigned to the receiver.
	It is required to unsubscribe from the model by implementing
	#unsubscribeFromModel if receiver subscribes to them"

	self model weak
		when: (GtLscInstanceModelRemoved
				where: [ :ann | ann lscInstanceModel id = lscInstanceModel id ])
		send: #onLscInstanceRemoved
		to: self.
	self model weak
		when: (GtLscInstanceModelRemoved
				where: [ :ann | (ann lscInstanceModel id = lscInstanceModel id) not ])
		send: #onInstancePositionsChanged
		to: self.
	self model weak
		when: GtLscInstanceModelWithPositionAnnouncement
		send: #onInstancePositionsChanged
		to: self.
]

{ #category : #'api - model' }
GtLscMoveInstanceButtonMenuItem >> unsubscribeFromModel [
	"Is sent before a new model is assigned to the receiver.
	Receivers that subscribe to model are required to implement this methods"
	
	self model unsubscribe: self
]

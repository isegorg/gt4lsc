Class {
	#name : #GtLscMoveInstanceRightButtonMenuItem,
	#superclass : #GtLscButtonMenuItem,
	#traits : 'TGtLscWithInstanceInLsc + TGtLscMenuItemWithAptitude + TGtLscMenuItemWithLabel + TGtLscMenuItemWithIcon + TGtLscMenuItemWithVisibility',
	#classTraits : 'TGtLscWithInstanceInLsc classTrait + TGtLscMenuItemWithAptitude classTrait + TGtLscMenuItemWithLabel classTrait + TGtLscMenuItemWithIcon classTrait + TGtLscMenuItemWithVisibility classTrait',
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #checking }
GtLscMoveInstanceRightButtonMenuItem >> checkInstanceInRightLimit [
	^ (model instances indexOf: lscInstanceModel) = model instancesSize
]

{ #category : #api }
GtLscMoveInstanceRightButtonMenuItem >> doClickAction [
	"The action to be executed when its view is clicked (BlClickEvent)"
	| instancePosition |
	instancePosition := model instances indexOf: lscInstanceModel.
	model moveInstanceFromPosition: instancePosition to: instancePosition + 1
]

{ #category : #initialization }
GtLscMoveInstanceRightButtonMenuItem >> initialize [
	self aptitudes: BrGlamorousButtonWithIconAptitude.
	self label: GtLscConstants moveInstanceRightButtonLabel.
	self icon: BrGlamorousIcons right.
	self visibility: BlVisibility visible
]

{ #category : #'events handling' }
GtLscMoveInstanceRightButtonMenuItem >> onLscInstanceRemoved [
	self visibility: BlVisibility gone
]

{ #category : #'api - model' }
GtLscMoveInstanceRightButtonMenuItem >> onModelChanged [
	"Is sent when a new model is assigned to the receiver"
	
	"The model (lsc) can not be changed to another if lsc instance is not in it"
	self checkInstance: lscInstanceModel isInLsc: model.
	self onVisibilityChanged
]

{ #category : #'events handling' }
GtLscMoveInstanceRightButtonMenuItem >> onVisibilityChanged [
	self checkInstanceInRightLimit ifFalse: [ ^ self ].
	self visibility: BlVisibility gone
]

{ #category : #'api - model' }
GtLscMoveInstanceRightButtonMenuItem >> subscribeToModel [
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
		send: #onVisibilityChanged
		to: self.
	self model weak
		when: GtLscInstanceModelWithPositionAnnouncement
		send: #onVisibilityChanged
		to: self.
		
]

{ #category : #'api - model' }
GtLscMoveInstanceRightButtonMenuItem >> unsubscribeFromModel [
	"Is sent before a new model is assigned to the receiver.
	Receivers that subscribe to model are required to implement this methods"
	
	self model unsubscribe: self
]

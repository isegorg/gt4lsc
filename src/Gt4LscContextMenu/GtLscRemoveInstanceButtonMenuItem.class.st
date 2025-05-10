Class {
	#name : #GtLscRemoveInstanceButtonMenuItem,
	#superclass : #GtLscButtonMenuItem,
	#traits : 'TGtLscWithInstanceInLsc + TGtLscMenuItemWithLabel + TGtLscMenuItemWithVisibility + TGtLscMenuItemWithIcon + TGtLscMenuItemWithAptitude',
	#classTraits : 'TGtLscWithInstanceInLsc classTrait + TGtLscMenuItemWithLabel classTrait + TGtLscMenuItemWithVisibility classTrait + TGtLscMenuItemWithIcon classTrait + TGtLscMenuItemWithAptitude classTrait',
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'default values' }
GtLscRemoveInstanceButtonMenuItem class >> defaultAptitudes [
	"overwrite with the aptitudes initialization value"
	^ BrGlamorousButtonWithIconAptitude
]

{ #category : #'default values' }
GtLscRemoveInstanceButtonMenuItem class >> defaultIcon [
	"Overwrite with the icon initialization value"
	^ BrGlamorousIcons trash
]

{ #category : #'default values' }
GtLscRemoveInstanceButtonMenuItem class >> defaultLabel [
	"Overwrite with the label initialization value"
	^ GtLscConstants removeInstanceButtonLabel
]

{ #category : #'default values' }
GtLscRemoveInstanceButtonMenuItem class >> defaultVisibility [
	"Overwrite with the visibility initialization value"
	^ BlVisibility visible
]

{ #category : #api }
GtLscRemoveInstanceButtonMenuItem >> doClickAction [
	"The action to be executed when its view is clicked (BlClickEvent)"
	model removeInstance: lscInstanceModel
]

{ #category : #'events handling' }
GtLscRemoveInstanceButtonMenuItem >> onLscInstanceRemoved [
	self visibility: BlVisibility gone
]

{ #category : #'api - model' }
GtLscRemoveInstanceButtonMenuItem >> onModelChanged [
	"Is sent when a new model is assigned to the receiver"
	
	"The model (lsc) can not be changed to another if lsc instance is not in it"
	self checkInstance: lscInstanceModel isInLsc: model.
	self visibility: BlVisibility visible
]

{ #category : #'api - model' }
GtLscRemoveInstanceButtonMenuItem >> subscribeToModel [
	"Is sent after a new model is assigned to the receiver.
	It is required to unsubscribe from the model by implementing
	#unsubscribeFromModel if receiver subscribes to them"

	self model weak
		when: (GtLscInstanceModelRemoved
				where: [ :ann | ann lscInstanceModel id = lscInstanceModel id ])
		send: #onLscInstanceRemoved
		to: self
]

{ #category : #'api - model' }
GtLscRemoveInstanceButtonMenuItem >> unsubscribeFromModel [
	"Is sent before a new model is assigned to the receiver.
	Receivers that subscribe to model are required to implement this methods"
	
	self model unsubscribe: self
]

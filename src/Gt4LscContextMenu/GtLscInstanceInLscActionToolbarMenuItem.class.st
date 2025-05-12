Class {
	#name : #GtLscInstanceInLscActionToolbarMenuItem,
	#superclass : #GtLscToolbarMenuItem,
	#traits : 'TGtLscWithInstanceInLsc',
	#classTraits : 'TGtLscWithInstanceInLsc classTrait',
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #api }
GtLscInstanceInLscActionToolbarMenuItem class >> actionButtonMenuItemClasses [
	^ OrderedCollection
		with: GtLscRemoveInstanceButtonMenuItem
		with: GtLscMoveInstanceRightButtonMenuItem
		with: GtLscMoveInstanceLeftButtonMenuItem
]

{ #category : #initialization }
GtLscInstanceInLscActionToolbarMenuItem >> addInitialMenuItems [
	"Add initial menu items"
	"Add an instance of each class of button that we need to perform actions on the instance in the Lsc"
	self
		menuItems: (self class actionButtonMenuItemClasses
				collect: [ :buttonClass | buttonClass forInstance: lscInstanceModel inLsc: model ])
]

{ #category : #'api - model' }
GtLscInstanceInLscActionToolbarMenuItem >> onModelChanged [
	"Is sent when a new model is assigned to the receiver"
	
	"The model (lsc) can not be changed to another if lsc instance is not in it"
	self checkInstance: lscInstanceModel isInLsc: model.
	self updateMenuItems
]

{ #category : #initialization }
GtLscInstanceInLscActionToolbarMenuItem >> updateMenuItems [
	self menuItems do: [ :buttonMenuItem | buttonMenuItem model: model ]
]

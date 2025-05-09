Class {
	#name : #GtLscButtonElement,
	#superclass : #BrButton,
	#traits : 'TGtLscMenuItemElement + TGtLscWithModel',
	#classTraits : 'TGtLscMenuItemElement classTrait + TGtLscWithModel classTrait',
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
GtLscButtonElement class >> createInstanceForMenuItem: aGtLscMenuItem [
	<return: #BlElement>
	
	^ self basicNew initialize model: aGtLscMenuItem
]

{ #category : #'instance creation' }
GtLscButtonElement class >> menuItemClass [
	<return: #'GtLscButtonMenuItem class'>
	^ GtLscButtonMenuItem
]

{ #category : #initialization }
GtLscButtonElement >> initialize [
	super initialize.

	self
		fitContent;
		beSmallSize;
		margin: (BlInsets
				top: 0
				left: 3
				bottom: 3
				right: 3)
]

{ #category : #'events handling' }
GtLscButtonElement >> onActionChanged [
	self action: [ self model doClickAction ]
]

{ #category : #'events handling' }
GtLscButtonElement >> onAptitudesChanged [
	"Update aptitudes if model has #aptitudes message. Use TGtLscMenuItemWithAptitudes in item"
	
	(self model respondsTo: #aptitudes) ifFalse: [ ^ self ].
	self aptitude: self model aptitudes
]

{ #category : #'events handling' }
GtLscButtonElement >> onIconChanged [
	"Update icon if model has #icon message. Use TGtLscMenuItemWithIcon in item"
	
	(self model respondsTo: #icon) ifFalse: [ ^ self ].
	self icon: self model icon
]

{ #category : #'events handling' }
GtLscButtonElement >> onLabelChanged [
	"Update label if model has #label message. Use TGtLscMenuItemWithLabel in item"
	
	(self model respondsTo: #label) ifFalse: [ ^ self ].
	self label: self model label
]

{ #category : #'api - model' }
GtLscButtonElement >> onModelChanged [
	"Is sent when a new model is assigned to the receiver"
	
	self onActionChanged.
	
	"For aptitudes, label, icon and visibility to be updated, the item must use TGtLscMenuItemWithAptitude, TGtLscMenuItemWithLabel, TGtLscMenuItemWithIcon and TGtLscMenuItemWithVisibility respectively."
	self onAptitudesChanged.
	self onLabelChanged.
	self onIconChanged.
	self onVisibilityChanged
]

{ #category : #'events handling' }
GtLscButtonElement >> onVisibilityChanged [
	"Update visibility if model has #visibility message. Use TGtLscMenuItemWithVisibility in item"
	
	(self model respondsTo: #visibility) ifFalse: [ ^ self ].
	self visibility: self model visibility
]

{ #category : #'api - model' }
GtLscButtonElement >> subscribeToModel [
	"Is sent after a new model is assigned to the receiver.
	It is required to unsubscribe from the model by implementing
	#unsubscribeFromModel if receiver subscribes to them"

	self model weak
		when: GtLscAptitudesChanged
		send: #onAptitudesChanged
		to: self.
	self model weak
		when: GtLscLabelChanged
		send: #onLabelChanged
		to: self.
	self model weak
		when: GtLscIconChanged
		send: #onIconChanged
		to: self.
	self model weak
		when: GtLscVisibilityChanged
		send: #onVisibilityChanged
		to: self
]

{ #category : #'api - model' }
GtLscButtonElement >> unsubscribeFromModel [
	"Is sent before a new model is assigned to the receiver.
	Receivers that subscribe to model are required to implement this methods"
	
	self model unsubscribe: self
]

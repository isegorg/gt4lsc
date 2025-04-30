Class {
	#name : #GtLscPickerMenuItem,
	#superclass : #GtLscMenuItem,
	#instVars : [
		'selectableItems'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #converting }
GtLscPickerMenuItem class >> elementClass [
	<return: #'BlElement class' with: #TGtLscMenuItemElement>
	^ GtLscPickerElement
]

{ #category : #initialization }
GtLscPickerMenuItem >> addSelectableMenuItems [
	"Add the GtLscSelectableMenuItems to selectableItems"
	self explicitRequirement
]

{ #category : #converting }
GtLscPickerMenuItem >> elementList [
	^ selectableItems collect: [ :item | item createElement ]
]

{ #category : #initialization }
GtLscPickerMenuItem >> initialize [
	super initialize.
	selectableItems := OrderedCollection empty.
	self addSelectableMenuItems
]

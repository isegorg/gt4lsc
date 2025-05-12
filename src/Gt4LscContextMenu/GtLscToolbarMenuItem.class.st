Class {
	#name : #GtLscToolbarMenuItem,
	#superclass : #GtLscMenuItem,
	#traits : 'TGtLscMenuItemWithItemCollection',
	#classTraits : 'TGtLscMenuItemWithItemCollection classTrait',
	#instVars : [
		'buttonMenuItems'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #converting }
GtLscToolbarMenuItem class >> elementClass [
	<return: #'BlElement class' with: #TGtLscMenuItemElement>
	^ GtLscToolbarElement
]

{ #category : #api }
GtLscToolbarMenuItem class >> menuItemsSlot [
	"Return the instance var name that is user for the collection of menu items in the class that uses the trait"

	^ #buttonMenuItems
]

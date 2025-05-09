Class {
	#name : #GtLscButtonMenuItem,
	#superclass : #GtLscMenuItem,
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #converting }
GtLscButtonMenuItem class >> elementClass [
	<return: #'BlElement class' with: #TGtLscMenuItemElement>
	^ GtLscButtonElement
]

{ #category : #api }
GtLscButtonMenuItem >> doClickAction [
	"The action to be executed when its view is clicked (BlClickEvent)"
	self explicitRequirement
]

Class {
	#name : #GtLscMenuItem,
	#superclass : #Object,
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #converting }
GtLscMenuItem class >> elementClass [
	<return: #'BlElement class' with: #TGtLscMenuItemElement>
	^ self explicitRequirement
]

{ #category : #converting }
GtLscMenuItem >> createElement [
	<return: #BlElement with: #TGtLscMenuItemElement>
	^ self class elementClass forMenuItem: self
]

{ #category : #converting }
GtLscMenuItem >> elementId [
	<return: #BlElementId>

	^ self className asBlocElementId
]

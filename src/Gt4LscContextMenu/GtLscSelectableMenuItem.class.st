Class {
	#name : #GtLscSelectableMenuItem,
	#superclass : #GtLscMenuItem,
	#instVars : [
		'selectionState'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #initialization }
GtLscSelectableMenuItem >> initialize [
	super initialize.
	selectionState := BlElementState deselected
]

{ #category : #'events generation' }
GtLscSelectableMenuItem >> notifySelectionStateChanged [
	self announce: GtLscSelectionStateChanged new
]

{ #category : #accessing }
GtLscSelectableMenuItem >> selectionState [
	^ selectionState
]

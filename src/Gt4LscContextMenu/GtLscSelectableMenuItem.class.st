Class {
	#name : #GtLscSelectableMenuItem,
	#superclass : #GtLscMenuItem,
	#instVars : [
		'selectionState'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #converting }
GtLscSelectableMenuItem class >> elementClass [
	<return: #'GtLscSelectableElement class'>
	self explicitRequirement
]

{ #category : #api }
GtLscSelectableMenuItem >> doSelectionAction [
	"The action to be executed when its view is clicked (BlClickEvent)"
	self explicitRequirement
]

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

{ #category : #accessing }
GtLscSelectableMenuItem >> selectionState: aSelectionState [
	selectionState = aSelectionState ifTrue: [ ^ self ].
	selectionState := aSelectionState.
	self notifySelectionStateChanged
]

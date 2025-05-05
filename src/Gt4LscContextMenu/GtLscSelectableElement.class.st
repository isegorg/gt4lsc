Class {
	#name : #GtLscSelectableElement,
	#superclass : #BlElement,
	#traits : 'TGtLscMenuItemElement',
	#classTraits : 'TGtLscMenuItemElement classTrait',
	#instVars : [
		'item'
	],
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
GtLscSelectableElement class >> createInstanceForMenuItem: aGtLscSelectableMenuItem [
	<return: #BlElement>
	
	^ self basicNew initialize item: aGtLscSelectableMenuItem
]

{ #category : #initialization }
GtLscSelectableElement class >> deselectedBorder [
	^ BlBorder empty
]

{ #category : #initialization }
GtLscSelectableElement class >> deselectedStyle [
	^ BlElementStyle new
		state: BlElementState selected not;
		border: self deselectedBorder
]

{ #category : #'instance creation' }
GtLscSelectableElement class >> menuItemClass [
	<return: #'GtLscMenuItem class'>
	^ GtLscSelectableElement
]

{ #category : #initialization }
GtLscSelectableElement class >> selectedBorder [
	^ BlBorder paint: Color black width: 3
]

{ #category : #initialization }
GtLscSelectableElement class >> selectedStyle [
	^ BlElementStyle new
		state: BlElementState selected;
		border: self selectedBorder
]

{ #category : #initialization }
GtLscSelectableElement >> initialize [
	super initialize.
	
	self
		withStylesDo: [ :theStyles | 
			theStyles
				addStyle: self class selectedStyle;
				addStyle: self class deselectedStyle ];
		when: BlClickEvent
			do: [ :anEvent | 
				anEvent consumed: true.
				(self states hasState: BlElementState selected not)
					ifTrue: [ item doSelectionAction ] ]
]

{ #category : #accessing }
GtLscSelectableElement >> item: aGtLscSelectableMenuItem [
	item := aGtLscSelectableMenuItem.
	self onSelectionStateChanged
]

{ #category : #'events handling' }
GtLscSelectableElement >> onSelectionStateChanged [
	self states addState: item selectionState
]

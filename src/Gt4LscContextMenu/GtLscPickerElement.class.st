Class {
	#name : #GtLscPickerElement,
	#superclass : #BrHorizontalGrid,
	#traits : 'TGtLscMenuItemElement',
	#classTraits : 'TGtLscMenuItemElement classTrait',
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
GtLscPickerElement class >> createInstanceForMenuItem: aGtLscPickerMenuItem [
	<return: #BlElement>
	^ self basicNew initialize elements: aGtLscPickerMenuItem elementList
]

{ #category : #'instance creation' }
GtLscPickerElement class >> menuItemClass [
	<return: #'GtLscMenuItem class'>
	^ GtLscPickerMenuItem
]

{ #category : #accessing }
GtLscPickerElement >> elements: aBlElementCollection [
	self removeChildren.
	self addChildren: aBlElementCollection
]

{ #category : #initialization }
GtLscPickerElement >> initialize [
	super initialize.
	self
		hFitContent;
		vFitContentLimited;
		columnCount: GtLscConstants pickerColumnCount;
		cellSpacing: GtLscConstants pickerCellSpacing
]

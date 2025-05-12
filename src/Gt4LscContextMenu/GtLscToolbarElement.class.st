Class {
	#name : #GtLscToolbarElement,
	#superclass : #BrToolbar,
	#traits : 'TGtLscMenuItemElement',
	#classTraits : 'TGtLscMenuItemElement classTrait',
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
GtLscToolbarElement class >> createInstanceForMenuItem: aGtLscToolbarMenuItem [
	<return: #BlElement>
	
	^ self basicNew initializeForMenuItems: aGtLscToolbarMenuItem menuItems
]

{ #category : #'instance creation' }
GtLscToolbarElement class >> menuItemClass [
	<return: #'GtLscToolbarMenuItem class'>
	^ GtLscToolbarMenuItem
]

{ #category : #api }
GtLscToolbarElement >> addElementsForMenuItems: aMenuItemCollection [

	self
		addItems: (aMenuItemCollection
				collect: [ :menuItem | (menuItem class elementClass forMenuItem: menuItem) ])
]

{ #category : #initialization }
GtLscToolbarElement >> initializeForMenuItems: aMenuItemCollection [
	super initialize.
	self
		constraintsDo: [ :c | 
			c frame horizontal alignRight.
			c frame vertical alignTop ];
		margin: (BlInsets
				top: 10
				right: 5
				bottom: 5
				left: 5);
		aptitude: BrGlamorousToolbarAptitude.
	self addElementsForMenuItems: aMenuItemCollection
]

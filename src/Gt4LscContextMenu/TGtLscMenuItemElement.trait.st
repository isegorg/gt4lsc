Trait {
	#name : #TGtLscMenuItemElement,
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
TGtLscMenuItemElement classSide >> createInstanceForMenuItem: aGtLscMenuItem [
	<return: #BlElement>
	
	self explicitRequirement
]

{ #category : #'instance creation' }
TGtLscMenuItemElement classSide >> forMenuItem: aGtLscMenuItem [
	<return: #BlElement>
	| element |
	self assert: (aGtLscMenuItem isKindOf: self menuItemClass) description: 'Can not create element for this type of GtLscMenuItem'.
	
	element := self createInstanceForMenuItem: aGtLscMenuItem.
	element id: aGtLscMenuItem elementId.
	^ element
]

{ #category : #'instance creation' }
TGtLscMenuItemElement classSide >> menuItemClass [
	<return: #'GtLscMenuItem class'>
	self explicitRequirement
]

{ #category : #'instance creation' }
TGtLscMenuItemElement classSide >> new [
	self error: 'Menu Item Elements are created with forMenuItem:'
]

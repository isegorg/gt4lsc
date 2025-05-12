Trait {
	#name : #TGtLscMenuItemWithItemCollection,
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #api }
TGtLscMenuItemWithItemCollection classSide >> menuItemsSlot [
	"Must return the instance var name that is user for the collection of menu items in the class that uses the trait"

	self explicitRequirement
]

{ #category : #api }
TGtLscMenuItemWithItemCollection >> addInitialMenuItems [
	"Add initial menu items"

	self explicitRequirement
]

{ #category : #api }
TGtLscMenuItemWithItemCollection >> menuItems [
	"returns the collection of menu items contained in me"

	<return: #Collection of: #GtLscMenuItem>
	(self instVarNamed: self class menuItemsSlot) ifNil: [ self addInitialMenuItems ].
	^ (self instVarNamed: self class menuItemsSlot)
]

{ #category : #api }
TGtLscMenuItemWithItemCollection >> menuItems: aMenuItemCollection [
	"Set the collection of menu items contained in me"

	self instVarNamed: self class menuItemsSlot put: aMenuItemCollection
]

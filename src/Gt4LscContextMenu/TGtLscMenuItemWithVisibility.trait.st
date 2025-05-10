Trait {
	#name : #TGtLscMenuItemWithVisibility,
	#instVars : [
		'visibility'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'default values' }
TGtLscMenuItemWithVisibility classSide >> defaultVisibility [
	"Overwrite with the visibility initialization value"
	self explicitRequirement
]

{ #category : #'events generation' }
TGtLscMenuItemWithVisibility >> notifyVisibilityChanged [
	self announce: GtLscVisibilityChanged new
]

{ #category : #accessing }
TGtLscMenuItemWithVisibility >> visibility [
	^ visibility ifNil: [ visibility := self class defaultVisibility ]
]

{ #category : #accessing }
TGtLscMenuItemWithVisibility >> visibility: aBlVisibility [
	visibility = aBlVisibility ifTrue: [ ^ self ].
	visibility := aBlVisibility.
	self notifyVisibilityChanged
]

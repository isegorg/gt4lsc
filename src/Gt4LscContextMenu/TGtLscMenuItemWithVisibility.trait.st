Trait {
	#name : #TGtLscMenuItemWithVisibility,
	#instVars : [
		'visibility'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'events generation' }
TGtLscMenuItemWithVisibility >> notifyVisibilityChanged [
	self announce: GtLscVisibilityChanged new
]

{ #category : #accessing }
TGtLscMenuItemWithVisibility >> visibility [
	^ visibility
]

{ #category : #accessing }
TGtLscMenuItemWithVisibility >> visibility: aBlVisibility [
	visibility = aBlVisibility ifTrue: [ ^ self ].
	visibility := aBlVisibility.
	self notifyVisibilityChanged
]

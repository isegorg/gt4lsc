Trait {
	#name : #TGtLscMenuItemWithIcon,
	#instVars : [
		'icon'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #accessing }
TGtLscMenuItemWithIcon >> icon [
	^ icon
]

{ #category : #accessing }
TGtLscMenuItemWithIcon >> icon: anElement [
	icon = anElement ifTrue: [ ^ self ].
	icon := anElement.
	self notifyIconChanged
]

{ #category : #'events generation' }
TGtLscMenuItemWithIcon >> notifyIconChanged [
	self announce: GtLscIconChanged new
]

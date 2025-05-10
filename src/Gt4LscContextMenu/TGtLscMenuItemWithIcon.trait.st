Trait {
	#name : #TGtLscMenuItemWithIcon,
	#instVars : [
		'icon'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'default values' }
TGtLscMenuItemWithIcon classSide >> defaultIcon [
	"Overwrite with the icon initialization value"
	self explicitRequirement
]

{ #category : #accessing }
TGtLscMenuItemWithIcon >> icon [
	^ icon ifNil: [ icon := self class defaultIcon ]
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

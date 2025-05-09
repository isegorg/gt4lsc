Trait {
	#name : #TGtLscMenuItemWithLabel,
	#instVars : [
		'label'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #accessing }
TGtLscMenuItemWithLabel >> label [
	^ label
]

{ #category : #accessing }
TGtLscMenuItemWithLabel >> label: aString [
	(aString = label) ifTrue: [ ^ self ].
	label := aString.
	self notifyLabelChanged
]

{ #category : #accessing }
TGtLscMenuItemWithLabel >> notifyLabelChanged [
	self announce: GtLscLabelChanged new
]

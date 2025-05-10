Trait {
	#name : #TGtLscMenuItemWithLabel,
	#instVars : [
		'label'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'default values' }
TGtLscMenuItemWithLabel classSide >> defaultLabel [
	"Overwrite with the label initialization value"
	self explicitRequirement
]

{ #category : #accessing }
TGtLscMenuItemWithLabel >> label [
	^ label ifNil: [ label := self class defaultLabel]
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

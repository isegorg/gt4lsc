Trait {
	#name : #TGtLscMenuItemWithAptitude,
	#instVars : [
		'aptitudes'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #accessing }
TGtLscMenuItemWithAptitude >> aptitudes [
	^ aptitudes
]

{ #category : #accessing }
TGtLscMenuItemWithAptitude >> aptitudes: anAptitude [
	anAptitude = aptitudes ifTrue: [ ^ self ].
	aptitudes := anAptitude.
	self notifyAptitudesChanged
]

{ #category : #'events generation' }
TGtLscMenuItemWithAptitude >> notifyAptitudesChanged [
	self announce: GtLscAptitudesChanged new
]

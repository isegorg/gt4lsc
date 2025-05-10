Trait {
	#name : #TGtLscMenuItemWithAptitude,
	#instVars : [
		'aptitudes'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'default values' }
TGtLscMenuItemWithAptitude classSide >> defaultAptitudes [
	"overwrite with the aptitudes initialization value"
	self explicitRequirement
]

{ #category : #accessing }
TGtLscMenuItemWithAptitude >> aptitudes [
	^ aptitudes ifNil: [ aptitudes := self class defaultAptitudes ]
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

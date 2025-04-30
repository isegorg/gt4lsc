Class {
	#name : #GtLscLabelElement,
	#superclass : #BrLabel,
	#traits : 'TGtLscMenuItemElement',
	#classTraits : 'TGtLscMenuItemElement classTrait',
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
GtLscLabelElement class >> createInstanceForMenuItem: aGtLscMenuItem [
	<return: #BlElement>

	^ (self basicNew initialize
		aptitude: (BrGlamorousLabelAptitude new foreground: Color darkGray);
		margin: (BlInsets
				top: 0
				left: 3
				bottom: 3
				right: 3)
				+ (BlInsets
						top: 5
						left: 0
						bottom: 0
						right: 0))
		text: (aGtLscMenuItem text ifNil: [ '' ])
]

{ #category : #'instance creation' }
GtLscLabelElement class >> menuItemClass [
	<return: #'GtLscMenuItem class'>
	^ GtLscLabelMenuItem
]

Class {
	#name : #GtLscMenuItem,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #converting }
GtLscMenuItem class >> elementClass [
	<return: #'BlElement class' with: #TGtLscMenuItemElement>
	^ self explicitRequirement
]

{ #category : #announcer }
GtLscMenuItem >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #converting }
GtLscMenuItem >> createElement [
	<return: #BlElement with: #TGtLscMenuItemElement>
	^ self class elementClass forMenuItem: self
]

{ #category : #converting }
GtLscMenuItem >> elementId [
	<return: #BlElementId>

	^ self className asBlocElementId
]

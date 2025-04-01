Class {
	#name : #GtLscInstanceViewModel,
	#superclass : #Object,
	#traits : 'TGtWithLscInstanceModel + TGtAnnouncer',
	#classTraits : 'TGtWithLscInstanceModel classTrait + TGtAnnouncer classTrait',
	#instVars : [
		'announcer'
	],
	#category : #'Gt4Lsc-! View models'
}

{ #category : #announcer }
GtLscInstanceViewModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

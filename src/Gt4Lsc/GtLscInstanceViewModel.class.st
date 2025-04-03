Class {
	#name : #GtLscInstanceViewModel,
	#superclass : #Object,
	#traits : 'TGtWithLscInstanceModel + TGtAnnouncer',
	#classTraits : 'TGtWithLscInstanceModel classTrait + TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'temperatureState'
	],
	#category : #'Gt4Lsc-! View models'
}

{ #category : #announcer }
GtLscInstanceViewModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtLscInstanceViewModel >> name [
	^ lscInstanceModel name
]

{ #category : #'api - lsc instance model' }
GtLscInstanceViewModel >> onLscInstanceModelChanged [
	"Is sent when a new lsc instance model is assigned to the view model"
	
	temperatureState := lscInstanceModel temperature asViewState
]

{ #category : #accessing }
GtLscInstanceViewModel >> temperatureState [
	^ temperatureState
]

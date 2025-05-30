Class {
	#name : #GtLscMessageViewModel,
	#superclass : #Object,
	#traits : 'TGtLscWithModel + TGtAnnouncer',
	#classTraits : 'TGtLscWithModel classTrait + TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'temperatureState',
		'elementId',
		'instanceId'
	],
	#category : #'Gt4Lsc-! View models'
}

{ #category : #'api - id operations' }
GtLscMessageViewModel class >> createElementIdFromModel: aMessageModel [
	^ GtLscConstants messageElementIdTemplate format: {aMessageModel id asString . aMessageModel instanceId asString}
]

{ #category : #announcer }
GtLscMessageViewModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtLscMessageViewModel >> elementId [
	^ elementId
]

{ #category : #accessing }
GtLscMessageViewModel >> instanceId [
	^ instanceId
]

{ #category : #accessing }
GtLscMessageViewModel >> name [
	^ model name
]

{ #category : #'events handling' }
GtLscMessageViewModel >> onIdChanged [
	elementId := self class createElementIdFromModel: model
]

{ #category : #'events handling' }
GtLscMessageViewModel >> onInstanceIdChanged [
	self onIdChanged.
	instanceId := GtLscInstanceViewModel createElementIdFromId: model instanceId.
]

{ #category : #'api - model' }
GtLscMessageViewModel >> onModelChanged [
	"Is sent when a new lsc message model is assigned to the view model"
	
	self onTemperatureChanged.
	self onIdChanged.
	self onInstanceIdChanged
]

{ #category : #'events handling' }
GtLscMessageViewModel >> onTemperatureChanged [

	temperatureState := model temperature asViewState.
]

{ #category : #accessing }
GtLscMessageViewModel >> temperatureState [
	^ temperatureState
]

{ #category : #accessing }
GtLscMessageViewModel >> text [
	^ model text
]

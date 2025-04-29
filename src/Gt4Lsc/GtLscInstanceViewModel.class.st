Class {
	#name : #GtLscInstanceViewModel,
	#superclass : #Object,
	#traits : 'TGtWithLscInstanceModel + TGtAnnouncer',
	#classTraits : 'TGtWithLscInstanceModel classTrait + TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'temperatureState',
		'elementId'
	],
	#category : #'Gt4Lsc-! View models'
}

{ #category : #'api - id operations' }
GtLscInstanceViewModel class >> createElementIdFromId: anId [
	^ GtLscConstants instanceElementIdTemplate format: {anId asString}
]

{ #category : #announcer }
GtLscInstanceViewModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtLscInstanceViewModel >> elementId [
	^ elementId
]

{ #category : #'api - lsc instance model' }
GtLscInstanceViewModel >> isForModel: aLscInstanceModel [
	^ aLscInstanceModel id = self lscInstanceModel id
		and: [ aLscInstanceModel name = self lscInstanceModel name ]
]

{ #category : #accessing }
GtLscInstanceViewModel >> name [
	^ lscInstanceModel name
]

{ #category : #'api - lsc instance model' }
GtLscInstanceViewModel >> name: aString [
	self lscInstanceModel name: aString
]

{ #category : #'events generation' }
GtLscInstanceViewModel >> notifyLscInstanceViewModelElementIdChanged [
	self announce: GtLscInstanceViewModelElementIdChanged new
]

{ #category : #'events generation' }
GtLscInstanceViewModel >> notifyLscInstanceViewModelNameChanged [
	self announce: GtLscInstanceViewModelNameChanged new
]

{ #category : #'events generation' }
GtLscInstanceViewModel >> notifyLscInstanceViewModelTemperatureStateChanged [
	self announce: GtLscInstanceViewModelTemperatureStateChanged new
]

{ #category : #'events handling' }
GtLscInstanceViewModel >> onIdChanged [
	elementId := self class createElementIdFromId: lscInstanceModel id.
	self notifyLscInstanceViewModelElementIdChanged
]

{ #category : #'api - lsc instance model' }
GtLscInstanceViewModel >> onLscInstanceModelChanged [
	"Is sent when a new lsc instance model is assigned to the view model"
	
	self onTemperatureChanged.
	self onIdChanged.
]

{ #category : #'events handling' }
GtLscInstanceViewModel >> onNameChanged: anAnnouncement [
	self notifyLscInstanceViewModelNameChanged
]

{ #category : #'events generation' }
GtLscInstanceViewModel >> onTemperatureChanged [

	temperatureState := lscInstanceModel temperature asViewState.
	self notifyLscInstanceViewModelTemperatureStateChanged
]

{ #category : #'api - lsc instance model' }
GtLscInstanceViewModel >> subscribeToLscInstanceModel [
	"Is sent after a new lsc instance model is assigned to the view model.
	It is required to unsubscribe from the domain model by implementing
	#unsubscribeFromLscInstanceModel if view model subscribes to them"
	
	self lscInstanceModel weak
		when: GtLscInstanceModelNameChanged
			send: #onNameChanged:
			to: self.
			
		self lscInstanceModel weak
		when: GtLscInstanceModelTemperatureChanged
			send: #onTemperatureChanged
			to: self.
			
		self lscInstanceModel weak
		when: GtLscInstanceModelIdChanged
			send: #onIdChanged
			to: self.
]

{ #category : #accessing }
GtLscInstanceViewModel >> temperatureState [
	^ temperatureState
]

{ #category : #'api - lsc instance model' }
GtLscInstanceViewModel >> unsubscribeFromLscInstanceModel [
	"Is sent before a new lsc instance model is assigned to the view model.
	View models that subscribe to lsc instance model are required to implement this methods"
	
	self lscInstanceModel unsubscribe: self
]

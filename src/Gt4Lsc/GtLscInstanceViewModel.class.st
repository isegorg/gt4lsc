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
GtLscInstanceViewModel >> name: aString [
	self lscInstanceModel name: aString
]

{ #category : #'events generation' }
GtLscInstanceViewModel >> notifyLscInstanceViewModelNameChanged [
	self announce: GtLscInstanceViewModelNameChanged new
]

{ #category : #'events generation' }
GtLscInstanceViewModel >> notifyLscInstanceViewModelTemperatureStateChanged [
	self announce: GtLscInstanceViewModelTemperatureStateChanged new
]

{ #category : #'api - lsc instance model' }
GtLscInstanceViewModel >> onLscInstanceModelChanged [
	"Is sent when a new lsc instance model is assigned to the view model"
	
	self onTemperatureChanged
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

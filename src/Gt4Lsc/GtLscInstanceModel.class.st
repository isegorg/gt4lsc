Class {
	#name : #GtLscInstanceModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'name',
		'temperature',
		'announcer',
		'id'
	],
	#category : #'Gt4Lsc-! Model'
}

{ #category : #'default model values' }
GtLscInstanceModel class >> defaultName [
	^ 'New Instance'
]

{ #category : #'default model values' }
GtLscInstanceModel class >> defaultTemperature [
	^ GtLscHotTemperature
]

{ #category : #announcer }
GtLscInstanceModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #converting }
GtLscInstanceModel >> asElement [
	^ GtLscInstanceElement new
		lscInstanceViewModel: (GtLscInstanceViewModel new lscInstanceModel: self);
		yourself
]

{ #category : #'gt - extensions' }
GtLscInstanceModel >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live';
		priority: 2;
		stencil: [ self asElement ]
]

{ #category : #testing }
GtLscInstanceModel >> hasId [
	^ id isNotNil
]

{ #category : #accessing }
GtLscInstanceModel >> id [
	^ id
]

{ #category : #accessing }
GtLscInstanceModel >> id: anObject [
	id := anObject.
	self notifyIdChanged
]

{ #category : #initialization }
GtLscInstanceModel >> initialize [
	name := self class defaultName.
	temperature := self class defaultTemperature
]

{ #category : #accessing }
GtLscInstanceModel >> name [
	^ name
]

{ #category : #accessing }
GtLscInstanceModel >> name: aString [
	self name = aString ifTrue: [ ^ self ].
	
	name := aString.
	self notifyNameChanged.
]

{ #category : #'events generation' }
GtLscInstanceModel >> notifyIdChanged [
	self announce: GtLscInstanceModelIdChanged new
]

{ #category : #'events generation' }
GtLscInstanceModel >> notifyNameChanged [
	self announce: GtLscInstanceModelNameChanged new
]

{ #category : #'events generation' }
GtLscInstanceModel >> notifyTemperatureChanged [
	self announce: GtLscInstanceModelTemperatureChanged new
]

{ #category : #accessing }
GtLscInstanceModel >> removeId [
	self id: nil
]

{ #category : #accessing }
GtLscInstanceModel >> temperature [
	^ temperature
]

{ #category : #accessing }
GtLscInstanceModel >> temperature: aGtLscTemperatureClass [
	temperature := aGtLscTemperatureClass.
	self notifyTemperatureChanged.
]

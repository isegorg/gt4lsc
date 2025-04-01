Class {
	#name : #GtLscInstanceModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'name',
		'temperature',
		'announcer'
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
GtLscInstanceModel >> temperature [
	^ temperature
]

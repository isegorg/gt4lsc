Class {
	#name : #GtLscMessageModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'instance',
		'temperature',
		'text',
		'id',
		'announcer'
	],
	#category : #'Gt4Lsc-! Model'
}

{ #category : #'default model values' }
GtLscMessageModel class >> defaultTemperature [
	^ GtLscHotTemperature
]

{ #category : #'instance creation' }
GtLscMessageModel class >> forInstance: aGtLscInstanceModel inLsc: aGtLscModel withText: aString [
	^ self basicNew initialize forInstance: aGtLscInstanceModel inLsc: aGtLscModel withText: aString
]

{ #category : #'instance creation' }
GtLscMessageModel class >> new [
	self error: 'Use #forInstance:inLsc:withText:'
]

{ #category : #announcer }
GtLscMessageModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #converting }
GtLscMessageModel >> asElement [
	^ GtLscMessageElement new
		model: (GtLscMessageViewModel new model: self);
		yourself
]

{ #category : #'instance creation' }
GtLscMessageModel >> forInstance: aGtLscInstanceModel inLsc: aGtLscModel withText: aString [
	self assert: (aGtLscModel hasInstance: aGtLscInstanceModel) description: 'Instance is not in Lsc'.
	instance := aGtLscInstanceModel.
	text := aString
]

{ #category : #checking }
GtLscMessageModel >> hasId [
	^ id isNotNil
]

{ #category : #accessing }
GtLscMessageModel >> id [
	^ id
]

{ #category : #accessing }
GtLscMessageModel >> id: anObject [
	id := anObject.
]

{ #category : #initialization }
GtLscMessageModel >> initialize [
	super initialize.

	temperature := self class defaultTemperature.
]

{ #category : #accessing }
GtLscMessageModel >> instanceId [
	^ instance id
]

{ #category : #checking }
GtLscMessageModel >> isRelatedToInstance: aGtLscInstanceModel [
	^ instance = aGtLscInstanceModel
]

{ #category : #accessing }
GtLscMessageModel >> removeId [
	self id: nil
]

{ #category : #accessing }
GtLscMessageModel >> temperature [
	^ temperature
]

{ #category : #accessing }
GtLscMessageModel >> text [
	^ text
]

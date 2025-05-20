Class {
	#name : #GtLscMessageModel,
	#superclass : #Object,
	#instVars : [
		'instance',
		'temperature',
		'text',
		'id'
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
GtLscMessageModel >> id: anObject [
	id := anObject.
]

{ #category : #initialization }
GtLscMessageModel >> initialize [
	super initialize.

	temperature := self class defaultTemperature.
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

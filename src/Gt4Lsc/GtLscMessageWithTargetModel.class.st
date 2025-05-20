Class {
	#name : #GtLscMessageWithTargetModel,
	#superclass : #GtLscMessageModel,
	#instVars : [
		'targetInstance'
	],
	#category : #'Gt4Lsc-! Model'
}

{ #category : #'instance creation' }
GtLscMessageWithTargetModel class >> forInstance: aGtLscInstanceModel andTarget: otherGtLscInstanceModel inLsc: aGtLscModel withText: aString [
	^ self basicNew initialize
		forInstance: aGtLscInstanceModel
		andTarget: otherGtLscInstanceModel
		inLsc: aGtLscModel
		withText: aString
]

{ #category : #'instance creation' }
GtLscMessageWithTargetModel class >> forInstance: aGtLscInstanceModel inLsc: aGtLscModel withText: aString [
	self error: 'Use #forInstance:andTarget:inLsc:withText:'
]

{ #category : #'instance creation' }
GtLscMessageWithTargetModel >> forInstance: aGtLscInstanceModel andTarget: otherGtLscInstanceModel inLsc: aGtLscModel withText: aString [
	self assert: (aGtLscModel hasInstance: aGtLscInstanceModel) description: 'Instance is not in Lsc'.
	self assert: (aGtLscModel hasInstance: otherGtLscInstanceModel) description: 'Target instance is not in Lsc'.
	instance := aGtLscInstanceModel.
	targetInstance := otherGtLscInstanceModel.
	text := aString
]

{ #category : #'instance creation' }
GtLscMessageWithTargetModel >> forInstance: aGtLscInstanceModel inLsc: aGtLscModel withText: aString [
	self error: 'Use #forInstance:andTarget:inLsc:withText:'
]

{ #category : #checking }
GtLscMessageWithTargetModel >> isRelatedToInstance: aGtLscInstanceModel [
	^ (super isRelatedToInstance: aGtLscInstanceModel) or: [ targetInstance = aGtLscInstanceModel ]
]

{ #category : #accessing }
GtLscMessageWithTargetModel >> target [
	^ targetInstance
]

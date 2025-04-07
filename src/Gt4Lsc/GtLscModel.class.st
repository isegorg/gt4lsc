Class {
	#name : #GtLscModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'title',
		'instances'
	],
	#category : #'Gt4Lsc-! Model'
}

{ #category : #'default model values' }
GtLscModel class >> defaultTitle [
	^ 'Scenario'
]

{ #category : #'api - instances' }
GtLscModel >> addInstance: aGtLscInstanceModel [
	self assert: (self hasInstance: aGtLscInstanceModel) not description: 'Can not add an instance already added'.
	instances add: aGtLscInstanceModel.
]

{ #category : #'api - instances' }
GtLscModel >> addInstance: aGtLscInstanceModel atPosition: anInteger [
	| previousIndex|
	self assert: (self hasInstance: aGtLscInstanceModel) not description: 'Can not add an instance already added'.
	self assert: (anInteger between: 1 and: instances size + 1) description: 'Invalid position'.
	previousIndex := anInteger - 1.
	instances add: aGtLscInstanceModel afterIndex: previousIndex.
]

{ #category : #announcer }
GtLscModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #converting }
GtLscModel >> asElement [
	^ GtLscElement new
		lscViewModel: (GtLscViewModel new lscModel: self);
		yourself
]

{ #category : #'gt - extensions' }
GtLscModel >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live';
		priority: 2;
		stencil: [ self asElement ]
]

{ #category : #testing }
GtLscModel >> hasInstance: aGtLscInstanceModel [
	self
		assert: [ aGtLscInstanceModel notNil ]
		description: [ 'Lsc instance must not be nil' ].
		
	^ instances includes: aGtLscInstanceModel
]

{ #category : #initialization }
GtLscModel >> initialize [
	title := self class defaultTitle.
	instances := OrderedCollection empty
]

{ #category : #'api - instances' }
GtLscModel >> instanceAt: anInteger [
	self assert: (anInteger between: 1 and: instances size) description: 'There are no instance at this position'.
	^ instances at: anInteger.
]

{ #category : #'api - instances' }
GtLscModel >> instancesSize [
	^ instances size
]

{ #category : #'api - instances' }
GtLscModel >> moveInstanceFromPosition: sourcePositionInteger to: targetPosition [
	| instanceToMove|
	self assert: (sourcePositionInteger between: 1 and: instances size) description: 'Non-existent source position'.
	self assert: (targetPosition between: 1 and: instances size) description: 'Non-existent source position'.
	instanceToMove := self instanceAt: sourcePositionInteger.
	self removeInstance: instanceToMove.
	self addInstance: instanceToMove atPosition: targetPosition
]

{ #category : #'events generation' }
GtLscModel >> notifyTitleChanged [
	self announce: GtLscTitleChanged new
]

{ #category : #'api - instances' }
GtLscModel >> removeInstance: aGtLscInstanceModel [
	self assert: (self hasInstance: aGtLscInstanceModel) description: 'Instance is not added'.
	instances remove: aGtLscInstanceModel.
]

{ #category : #accessing }
GtLscModel >> title [
	^ title
]

{ #category : #accessing }
GtLscModel >> title: aString [
	self title = aString ifTrue: [ ^ self ].

	title := aString.
	self notifyTitleChanged.
]

Class {
	#name : #GtLscModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'title',
		'instances',
		'messages'
	],
	#category : #'Gt4Lsc-! Model'
}

{ #category : #checking }
GtLscModel class >> checkValidPostion: anInteger toAddInCollectionWithSize: aCollectionSize [
	self assert: (anInteger between: 1 and: aCollectionSize + 1) description: 'Invalid position'.
]

{ #category : #'default model values' }
GtLscModel class >> defaultTitle [
	^ 'Scenario'
]

{ #category : #'private - collection operations' }
GtLscModel >> addElement: newElementWithId atPosition: anInteger inCollection: anOrderedCollection [
	| previousIndex |
	self class checkValidPostion: anInteger toAddInCollectionWithSize: anOrderedCollection size.
	self addIdTo: newElementWithId.
	previousIndex := anInteger - 1.
	^ anOrderedCollection add: newElementWithId afterIndex: previousIndex
]

{ #category : #'api - id operations' }
GtLscModel >> addIdTo: aObjectWithId [
	aObjectWithId id: self nextUniqueId
]

{ #category : #'api - instances' }
GtLscModel >> addInstance: aGtLscInstanceModel [
	self addInstance: aGtLscInstanceModel atPosition: self instancesSize + 1.
]

{ #category : #'api - instances' }
GtLscModel >> addInstance: aGtLscInstanceModel atPosition: anInteger [
	self assert: (self hasInstance: aGtLscInstanceModel) not description: 'Can not add an instance already added'.
	self addElement: aGtLscInstanceModel atPosition: anInteger inCollection: instances.
	self notifyInstanceAdded: aGtLscInstanceModel atPosition: anInteger.
]

{ #category : #'api  - messages' }
GtLscModel >> addMessageForInstance: aGtLscInstanceModel withText: aString [
	^ self addMessageForInstance: aGtLscInstanceModel withText: aString atPosition: self messagesSize + 1
]

{ #category : #'api  - messages' }
GtLscModel >> addMessageForInstance: aGtLscInstanceModel withText: aString andTarget: otherGtLscInstanceModel [
	^ self addMessageForInstance: aGtLscInstanceModel withText: aString andTarget: otherGtLscInstanceModel atPosition: self messagesSize + 1
]

{ #category : #'api  - messages' }
GtLscModel >> addMessageForInstance: aGtLscInstanceModel withText: aString andTarget: otherGtLscInstanceModel atPosition: anInteger [
	| newMessage|
	newMessage := GtLscMessageWithTargetModel forInstance: aGtLscInstanceModel andTarget: otherGtLscInstanceModel inLsc: self withText: aString.
	^ self addElement: newMessage atPosition: anInteger inCollection: messages.
]

{ #category : #'api  - messages' }
GtLscModel >> addMessageForInstance: aGtLscInstanceModel withText: aString atPosition: anInteger [
	| newMessage |
	newMessage := GtLscMessageModel forInstance: aGtLscInstanceModel inLsc: self withText: aString.
	^ self addElement: newMessage atPosition: anInteger inCollection: messages.
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

{ #category : #testing }
GtLscModel >> hasMessage: aGtLscMessageModel [
	self
		assert: [ aGtLscMessageModel notNil ]
		description: [ 'Lsc message must not be nil' ].
		
	^ messages includes: aGtLscMessageModel
]

{ #category : #initialization }
GtLscModel >> initialize [
	title := self class defaultTitle.
	instances := OrderedCollection empty.
	messages := OrderedCollection empty
]

{ #category : #'api - instances' }
GtLscModel >> instanceAt: anInteger [
	self assert: (anInteger between: 1 and: instances size) description: 'There are no instance at this position'.
	^ instances at: anInteger.
]

{ #category : #'api - instances' }
GtLscModel >> instanceWithId: anId ifFound: aFoundBlock ifNone: aNoneBlock [
	^ instances
		detect: [ :eachInstance | eachInstance id = anId ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #'api - instances' }
GtLscModel >> instances [
	^ instances
]

{ #category : #'api - instances' }
GtLscModel >> instancesSize [
	^ instances size
]

{ #category : #'api - instances' }
GtLscModel >> messageAt: anInteger [
	self assert: (anInteger between: 1 and: self messagesSize) description: 'There are no message at this position'.
	^ messages at: anInteger.
]

{ #category : #'api - instances' }
GtLscModel >> messagesSize [
	^ messages size
]

{ #category : #'api - instances' }
GtLscModel >> moveInstanceFromPosition: sourcePositionInteger to: targetPosition [
	| instanceToMove previousIndex |
	self
		assert: (sourcePositionInteger between: 1 and: self instancesSize)
		description: 'Non-existent source position'.
	self
		assert: (targetPosition between: 1 and: self instancesSize)
		description: 'Non-existent source position'.
	sourcePositionInteger = targetPosition ifTrue: [ ^ self ].
	instanceToMove := self instanceAt: sourcePositionInteger.
	instances remove: instanceToMove.
	previousIndex := targetPosition - 1.
	instances add: instanceToMove afterIndex: previousIndex.
	self notifyInstanceMoved: instanceToMove atPosition: targetPosition.
]

{ #category : #'api - id operations' }
GtLscModel >> nextUniqueId [
	| aNextId |
	
	aNextId := UUIDGenerator next.
	[
	self
		instanceWithId: aNextId
		ifFound: [ false ]
		ifNone: [ true ] ] whileFalse: [ aNextId := UUIDGenerator next ].

	^ aNextId
]

{ #category : #'events generation' }
GtLscModel >> notifyInstanceAdded: aGtLscInstanceModel atPosition: anInteger [
	self announce: (GtLscInstanceModelAdded lscInstanceModel: aGtLscInstanceModel atPosition: anInteger)
]

{ #category : #'events generation' }
GtLscModel >> notifyInstanceMoved: aGtLscInstanceModel atPosition: anInteger [
	self announce: (GtLscInstanceModelMoved lscInstanceModel: aGtLscInstanceModel atPosition: anInteger)
]

{ #category : #'events generation' }
GtLscModel >> notifyInstanceRemoved: aGtLscInstanceModel [
	self announce: (GtLscInstanceModelRemoved lscInstanceModel: aGtLscInstanceModel)
]

{ #category : #'events generation' }
GtLscModel >> notifyTitleChanged [
	self announce: GtLscTitleChanged new
]

{ #category : #'api  - messages' }
GtLscModel >> relatedMessagesForInstance: aGtLscInstanceModel [
	self assert: (self hasInstance: aGtLscInstanceModel) description:'Instance is not in Lsc'.
	^ messages select: [ :message | message isRelatedToInstance: aGtLscInstanceModel ]
]

{ #category : #'api - id operations' }
GtLscModel >> removeIdFrom: aObjectWithId [
	aObjectWithId removeId
]

{ #category : #'api - instances' }
GtLscModel >> removeInstance: aGtLscInstanceModel [
	self assert: (self hasInstance: aGtLscInstanceModel) description: 'Instance is not added'.
	self removeRelatedMessagesForInstance: aGtLscInstanceModel.
	instances remove: aGtLscInstanceModel.
	self notifyInstanceRemoved: aGtLscInstanceModel.
	self removeIdFrom: aGtLscInstanceModel
]

{ #category : #'api - instances' }
GtLscModel >> removeMessage: aGtLscMessageModel [
	self assert: (self hasMessage: aGtLscMessageModel) description: 'Message is not added'.
	messages remove: aGtLscMessageModel.
	self removeIdFrom: aGtLscMessageModel
]

{ #category : #'api  - messages' }
GtLscModel >> removeRelatedMessagesForInstance: aGtLscInstanceModel [
	self assert: (self hasInstance: aGtLscInstanceModel) description: 'Instance is not added'.
	(self relatedMessagesForInstance: aGtLscInstanceModel) do: [ :relatedMessage | self removeMessage: relatedMessage ]
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

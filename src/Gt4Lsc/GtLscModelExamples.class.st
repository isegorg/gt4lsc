Class {
	#name : #GtLscModelExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'Gt4Lsc-Examples'
}

{ #category : #'examples - model' }
GtLscModelExamples >> lscAddInstanceAtPosition [
	<gtExample>
	| aLsc existingInstance newInstance |
	aLsc := self lscWithInstance.
	existingInstance := aLsc instanceAt: 1.
	newInstance := GtLscInstanceModel new name: 'Instance to add'.
	aLsc addInstance: newInstance atPosition: 1.

	self assert: newInstance hasId.
	self assert: (aLsc instanceAt: 1) equals: newInstance.
	self assert: (aLsc instanceAt: 2) equals: existingInstance.
	self assert: aLsc instancesSize equals: 2.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscAddMessage [
	<gtExample>
	| aLsc anInstance messageText newMessage |
	aLsc := self lscWithInstance.
	anInstance := aLsc instanceAt: 1.
	
	messageText := 'New Message'.
	aLsc addMessageForInstance: anInstance withText: messageText.

	"Check that Lsc has the message"
	self assert: aLsc messagesSize equals: 1.
	newMessage := aLsc messageAt: 1.
	self assert: newMessage hasId.
	self assert: newMessage text equals: messageText.
	self assert: newMessage temperature equals: GtLscMessageModel defaultTemperature.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscAddMessageAtPosition [
	<gtExample>
	| aLsc existingMessage firstInstance secondInstance  newMessage newMessageWithTarget |
	aLsc := self lscAddMessageWithTarget.
	existingMessage := aLsc messageAt: 1.
	firstInstance := aLsc instanceAt: 1.
	secondInstance := aLsc instanceAt: 2.
	
	"Add message at position"
	newMessage := aLsc addMessageForInstance: secondInstance withText: 'Message added at first position' atPosition: 1.
	
	"Check adding message at position"
	self assert: (aLsc messageAt: 1) equals: newMessage.
	self assert: (aLsc messageAt: 2) equals: existingMessage.
	self assert: aLsc messagesSize equals: 2.

	"Add message with target at position"
	newMessageWithTarget := aLsc addMessageForInstance: secondInstance withText: 'Message with target added at second position' andTarget: firstInstance atPosition: 2.
	
	"Check adding message with target at position"
	self assert: (aLsc messageAt: 1) equals: newMessage.
	self assert: (aLsc messageAt: 2) equals: newMessageWithTarget.
	self assert: (aLsc messageAt: 3) equals: existingMessage.
	self assert: aLsc messagesSize equals: 3.
	
	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscAddMessageWithTarget [
	<gtExample>
	| aLsc sourceInstance targetInstance messageText newMessage |
	aLsc := self lscAddInstanceAtPosition.
	sourceInstance := aLsc instanceAt: 1.
	targetInstance := aLsc instanceAt: 2.
	
	messageText := 'New Message With Target'.
	aLsc addMessageForInstance: sourceInstance withText: messageText andTarget: targetInstance.

	"Check that Lsc has the message"
	self assert: aLsc messagesSize equals: 1.
	newMessage := aLsc messageAt: 1.
	self assert: newMessage hasId.
	self assert: newMessage text equals: messageText.
	self assert: newMessage temperature equals: GtLscMessageModel defaultTemperature.
	self assert: newMessage target equals: targetInstance.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscMoveInstanceToPosition [
	<gtExample>
	| aLsc initialFirstInstance initialFirstInstanceId initialSecondInstance initialSecondInstanceId finalFirstInstance finalFirstInstanceId finalSecondInstance finalSecondInstanceId |
	aLsc := self lscAddInstanceAtPosition.
	initialFirstInstance := aLsc instanceAt: 1.
	initialFirstInstanceId := initialFirstInstance id.
	initialSecondInstance := aLsc instanceAt: 2.
	initialSecondInstanceId := initialSecondInstance id.
	aLsc moveInstanceFromPosition: 1 to: 2.

	finalFirstInstance := aLsc instanceAt: 1.
	finalFirstInstanceId := finalFirstInstance id.
	finalSecondInstance := aLsc instanceAt: 2.
	finalSecondInstanceId := finalSecondInstance id.
	
	"Check instance positions and instance ids do not change"
	self assert: finalFirstInstance equals: initialSecondInstance.
	self assert: finalFirstInstanceId equals: initialSecondInstanceId.
	self assert: finalSecondInstance equals: initialFirstInstance.
	self assert: finalSecondInstanceId equals: initialFirstInstanceId.
	self assert: aLsc instancesSize equals: 2.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscRemoveInstance [
	<gtExample>
	| aLsc anInstance |
	aLsc := self lscWithInstance.
	anInstance := aLsc instanceAt: 1.
	aLsc removeInstance: anInstance.

	self assert: anInstance hasId not.
	self assert: (aLsc hasInstance: anInstance) not.
	self assert: aLsc instancesSize equals: 0.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscRemoveInstanceWithRelatedMessagesAsDestination [
	<gtExample>
	| aLsc aMessage destinationInstance |
	aLsc := self lscAddMessageWithTarget.
	aMessage := aLsc messageAt: 1.
	destinationInstance := aMessage target.
	self assert: (aLsc relatedMessagesForInstance: destinationInstance) size equals: 1.
	
	"Remove destination instance"
	aLsc removeInstance: destinationInstance.

	"Check message removed"
	self assert: aLsc messagesSize equals: 0.
	self should: [aLsc relatedMessagesForInstance: destinationInstance] raise: AssertionFailure.
	self should: [aLsc removeMessage: aMessage] raise: AssertionFailure.
	self should: [aLsc removeInstance: destinationInstance] raise: AssertionFailure.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscRemoveInstanceWithRelatedMessagesAsSource [
	<gtExample>
	| aLsc anInstance |
	aLsc := self lscAddMessage.
	anInstance := aLsc instanceAt: 1.
	self assert: (aLsc relatedMessagesForInstance: anInstance) size equals: 1.
	
	"Remove instance"
	aLsc removeInstance: anInstance.

	"Check message removed"
	self assert: aLsc messagesSize equals: 0.
	self should: [aLsc relatedMessagesForInstance: anInstance] raise: AssertionFailure.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscRemoveMessage [
	<gtExample>
	| aLsc aMessage |
	aLsc := self lscAddMessage.
	aMessage := aLsc messageAt: 1.
	aLsc removeMessage: aMessage.

	self assert: aMessage hasId not.
	self assert: (aLsc hasMessage: aMessage) not.
	self assert: aLsc messagesSize equals: 0.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscWithInstance [
	<gtExample>
	| aLsc anInstance |
	aLsc := self newLsc.
	anInstance := GtLscInstanceModel new.
	
	"Check that Lsc instance has not id if it is not added to a Lsc"
	self assert: anInstance hasId not.
	
	aLsc addInstance: anInstance.
	[ aLsc addInstance: anInstance ] on: Exception do: [ :e | e description = 'Can not add an instance already added' ].

	self assert: anInstance hasId.
	self assert: (aLsc hasInstance: anInstance).
	self assert: aLsc instancesSize equals: 1.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> newLsc [
	<gtExample>
	| lsc |
	lsc := GtLscModel new.
	self assert: lsc title equals: GtLscModel defaultTitle.
	self assert: lsc instancesSize equals: 0.
	self assert: lsc messagesSize equals: 0.
	^ lsc
]

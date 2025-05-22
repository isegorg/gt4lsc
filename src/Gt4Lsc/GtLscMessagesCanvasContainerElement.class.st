Class {
	#name : #GtLscMessagesCanvasContainerElement,
	#superclass : #BrVerticalPane,
	#category : #'Gt4Lsc-! Views'
}

{ #category : #initialization }
GtLscMessagesCanvasContainerElement >> addDummyElement [
| asInstanceNameElement |
	self flag: #'TODO Improve how to know the dimension of GtLscInstanceElement name'.
	asInstanceNameElement := BrEditableLabel new
		hMatchParent;
		vFitContent;
		aptitude: BrGlamorousRegularEditorAptitude + BrGlamorousEditorSpacingAptitude;
		constraintsDo: [ :c | c linear horizontal alignCenter ];
		id: GtLscConstants messagesCanvasContainerDummyElementId;
		text: 'Dummy Element';
		border: Color black;
		visibility: BlVisibility hidden;
		yourself.
	self addChild: asInstanceNameElement
]

{ #category : #initialization }
GtLscMessagesCanvasContainerElement >> addMessagesCanvasElement [
	self addChild: GtLscMessagesCanvasElement new
]

{ #category : #initialization }
GtLscMessagesCanvasContainerElement >> initialize [
	super initialize.
	
	self matchParent.
	self addDummyElement.
	self addMessagesCanvasElement.
	self id: GtLscConstants messagesCanvasContainerId
]

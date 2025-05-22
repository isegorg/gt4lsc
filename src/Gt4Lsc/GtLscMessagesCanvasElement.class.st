Class {
	#name : #GtLscMessagesCanvasElement,
	#superclass : #BrVerticalPane,
	#category : #'Gt4Lsc-! Views'
}

{ #category : #initialization }
GtLscMessagesCanvasElement >> initialize [
	super initialize.
	
	self matchParent.
	self id: GtLscConstants messagesCanvasId
]

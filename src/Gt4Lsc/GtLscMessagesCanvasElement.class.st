Class {
	#name : #GtLscMessagesCanvasElement,
	#superclass : #BrVerticalPane,
	#traits : 'TGtLscWithModel',
	#classTraits : 'TGtLscWithModel classTrait',
	#category : #'Gt4Lsc-! Views'
}

{ #category : #'utilities - message view creation' }
GtLscMessagesCanvasElement class >> createNewLseMessageElement [
	^ GtLscMessageElement new
]

{ #category : #'api - model' }
GtLscMessagesCanvasElement >> addMessageElementFor: aLscMessageViewModel [
	| newLscMessageElement |
	newLscMessageElement := self class createNewLseMessageElement.
	self addChild: newLscMessageElement.
	newLscMessageElement model: aLscMessageViewModel
]

{ #category : #initialization }
GtLscMessagesCanvasElement >> initialize [
	super initialize.
	
	self matchParent.
	self id: GtLscConstants messagesCanvasId
]

{ #category : #'api - model' }
GtLscMessagesCanvasElement >> onModelChanged [
	"Is sent when a new Lsc view model is assigned to the element"

	self removeChildren.
	self model messageViewModels
		do: [ :eachLscMessageViewModel | self addMessageElementFor: eachLscMessageViewModel ]
]

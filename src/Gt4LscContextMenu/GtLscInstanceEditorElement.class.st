Class {
	#name : #GtLscInstanceEditorElement,
	#superclass : #BrVerticalPane,
	#traits : 'TGtWithLscInstanceViewModel',
	#classTraits : 'TGtWithLscInstanceViewModel classTrait',
	#instVars : [
		'container'
	],
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
GtLscInstanceEditorElement class >> forInstance: aLscInstanceModel inLsc: aLscModel [
	^ self basicNew initialize
		lscInstanceViewModel: (GtLscInstanceInLscEditorViewModel forInstance: aLscInstanceModel inLsc: aLscModel)
]

{ #category : #'instance creation' }
GtLscInstanceEditorElement class >> forModel: aLscInstanceModel [
	^ self basicNew initialize
		lscInstanceViewModel: (GtLscInstanceEditorViewModel new lscInstanceModel: aLscInstanceModel)
]

{ #category : #'instance creation' }
GtLscInstanceEditorElement class >> new [

	self error: 'Editors are created with forModel:'
]

{ #category : #initialization }
GtLscInstanceEditorElement >> createPropertiesEditorContainer [
	^ BrVerticalPane new
		hFitContent;
		vFitContentLimited;
		id: #container;
		yourself
]

{ #category : #initialization }
GtLscInstanceEditorElement >> initialize [
	super initialize.

	self
		hFitContent;
		vFitContentLimited;
		padding: (BlInsets all: 3).
	self id: self className.

	container := self createPropertiesEditorContainer.
	
	self
		addChild:
			(BrScrollPane new
				aptitude: BrScrollPaneAptitude + BrGlamorousWithVerticalScrollbarAptitude;
				vFitContentLimited;
				hFitContent;
				content: container)
]

{ #category : #'api - lsc instance view model' }
GtLscInstanceEditorElement >> onLscInstanceViewModelChanged [
	"Is sent when a new Lsc instance view model is assigned to the element"
	
	self updateContainer.
]

{ #category : #'private - updating' }
GtLscInstanceEditorElement >> updateContainer [
	container removeChildren.
	container addChildren: lscInstanceViewModel elementList
]

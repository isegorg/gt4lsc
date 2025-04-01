Class {
	#name : #GtLscElement,
	#superclass : #BlElement,
	#traits : 'TGtWithLscViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithLscViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'titleElement',
		'canvasContainer'
	],
	#category : #'Gt4Lsc-! Views'
}

{ #category : #initialization }
GtLscElement >> createCanvasContainer [
	^ BrFrame new matchParent; id: #canvasContainer
]

{ #category : #initialization }
GtLscElement >> createTitleElement [
	^ BrEditableLabel new
		hFitContentLimited;
		vFitContent;
		aptitude: BrGlamorousRegularEditorAptitude new;
		"visibility: BlVisibility visible;"
		constraintsDo: [ :c | c linear horizontal alignCenter ];
		when: BrEditorAcceptWish do: [ :aWish | self onAcceptNewTitleWish: aWish ];
		text: 'Title'
]

{ #category : #initialization }
GtLscElement >> defaultLayout [
	^ BlLinearLayout vertical
]

{ #category : #initialization }
GtLscElement >> initialize [
	super initialize.
	
	titleElement := self createTitleElement.
	canvasContainer := self createCanvasContainer.
	
	self addChildren: {titleElement. canvasContainer}.
	
	self matchParent
]

{ #category : #'event handling' }
GtLscElement >> onAcceptNewTitleWish: aWish [ 
	self hasLscViewModel ifFalse: [ ^ self ].
	self lscViewModel title: aWish text asString
]

{ #category : #'api - lsc view model' }
GtLscElement >> onLscViewModelChanged [
	"Is sent when a new Lsc view model is assigned to the element"

	self onTitleChanged
]

{ #category : #'event handling' }
GtLscElement >> onTitleChanged [
	titleElement text: self lscViewModel title
]

{ #category : #'api - lsc view model' }
GtLscElement >> subscribeToLscViewModel [
	"Is sent after a new Lsc view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromLscViewModel if elements subscribe to them"
	
	self lscViewModel weak
		when: GtLscViewModelTitleChanged
			send: #onTitleChanged
			to: self
]

{ #category : #api }
GtLscElement >> titleString [
	^ titleElement text asString
]

{ #category : #'api - lsc view model' }
GtLscElement >> unsubscribeFromLscViewModel [
	"Is sent before a new Lsc view model is assigned to the element.
	Elements that subscribe to Lsc view model in domain model are required to implement this methods"
	
	self lscViewModel unsubscribe: self
]

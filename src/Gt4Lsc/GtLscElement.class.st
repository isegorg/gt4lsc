Class {
	#name : #GtLscElement,
	#superclass : #BlElement,
	#traits : 'TGtWithLscViewModel + TBrLayoutResizable',
	#classTraits : 'TGtWithLscViewModel classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'titleElement',
		'canvasContainer',
		'instancesCanvas'
	],
	#category : #'Gt4Lsc-! Views'
}

{ #category : #initialization }
GtLscElement >> createCanvasesContainer [
	^ BrFrame new matchParent; id: GtLscConstants canvasesContainerElementId
]

{ #category : #initialization }
GtLscElement >> createInstancesCanvas [
	^ GtLscInstancesCanvasElement new id: GtLscConstants instancesCanvasId
]

{ #category : #initialization }
GtLscElement >> createTitleElement [
	^ BrEditableLabel new
		hFitContentLimited;
		vFitContent;
		aptitude: BrGlamorousRegularEditorAptitude + BrGlamorousEditorSpacingAptitude;
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
	canvasContainer := self createCanvasesContainer.
	instancesCanvas := self createInstancesCanvas.
	canvasContainer addChild: instancesCanvas.
	
	self addChildren: {titleElement. canvasContainer}.
	
	self matchParent
]

{ #category : #'events handling' }
GtLscElement >> onAcceptNewTitleWish: aWish [ 
	self hasLscViewModel ifFalse: [ ^ self ].
	self lscViewModel title: aWish text asString
]

{ #category : #'api - lsc view model' }
GtLscElement >> onLscViewModelChanged [
	"Is sent when a new Lsc view model is assigned to the element"

	self onTitleChanged.
	instancesCanvas lscViewModel: self lscViewModel
]

{ #category : #'events handling' }
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

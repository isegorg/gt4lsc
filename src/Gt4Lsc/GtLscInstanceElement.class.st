Class {
	#name : #GtLscInstanceElement,
	#superclass : #BrVerticalPane,
	#traits : 'TGtWithLscInstanceViewModel',
	#classTraits : 'TGtWithLscInstanceViewModel classTrait',
	#instVars : [
		'nameElement',
		'locationElement'
	],
	#category : #'Gt4Lsc-! Views'
}

{ #category : #initialization }
GtLscInstanceElement >> createLocationElement [
	| element locationLine |
	element := BlElement new
		constraintsDo: [ :c |
			c horizontal exact: GtLscConstants locationLineWidth.
			c vertical matchParent.
			c linear horizontal alignCenter ];
		id: GtLscConstants locationElementId.
	locationLine := BlLineElement new
		fromAnchor: (BlElementTopCenterAnchor element: element);
		toAnchor: (BlElementBottomCenterAnchor element: element);
		id: GtLscConstants locationLineId.
	locationLine states addState: GtLscConstants defaultTemperatureState.
	locationLine withStylesDo: [ :theStyles |
		theStyles
			addStyle: (BlElementStyle new
				state: BlElementHotState uniqueInstance;
				border: (GtLscConstants hotBorder copyWithWidth: GtLscConstants locationLineWidth));
			addStyle: (BlElementStyle new
				state: BlElementHotState uniqueInstance not;
				border: (GtLscConstants coldBorder copyWithWidth: GtLscConstants locationLineWidth)) ].
	element addChild: locationLine.
	^ element
]

{ #category : #initialization }
GtLscInstanceElement >> createNameElement [
	^ BrEditableLabel new
		hFitContentLimited;
		vFitContent;
		aptitude: BrGlamorousRegularEditorAptitude + BrGlamorousEditorSpacingAptitude;
		constraintsDo: [ :c | c linear horizontal alignCenter ];
		when: BrEditorAcceptWish do: [ :aWish | self onAcceptNewTitleWish: aWish ];
		text: 'Name'
]

{ #category : #initialization }
GtLscInstanceElement >> initialize [
	super initialize.
	nameElement := self createNameElement.
	locationElement := self createLocationElement.
	
	self addChildren: {nameElement . locationElement}.
	self matchParent
]

{ #category : #'private - accessing' }
GtLscInstanceElement >> locationLineElement [
	^ self childNamed: GtLscConstants locationLineId
]

{ #category : #initialization }
GtLscInstanceElement >> onAcceptNewTitleWish: aWish [ 
]

{ #category : #'api - lsc instance view model' }
GtLscInstanceElement >> onLscInstanceViewModelChanged [
	"Is sent when a new Lsc instance view model is assigned to the element"
	
	self onNameChanged.
	self onTemperatureStateChanged.
]

{ #category : #'events handling' }
GtLscInstanceElement >> onNameChanged [
	nameElement text: self lscInstanceViewModel name
]

{ #category : #'events handling' }
GtLscInstanceElement >> onTemperatureStateChanged [
	self locationLineElement states addState: self lscInstanceViewModel temperatureState
]

{ #category : #'api - lsc instance view model' }
GtLscInstanceElement >> subscribeToLscInstanceViewModel [
	"Is sent after a new Lsc instance view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromLscInstanceViewModel if elements subscribe to them"
	
	self lscInstanceViewModel weak
		when: GtLscInstanceViewModelNameChanged
			send: #onNameChanged
			to: self.
	self lscInstanceViewModel weak
		when: GtLscInstanceViewModelTemperatureStateChanged
			send: #onTemperatureStateChanged
			to: self.
]

{ #category : #'api - lsc instance view model' }
GtLscInstanceElement >> unsubscribeFromLscInstanceViewModel [
	"Is sent before a new Lsc instance view model is assigned to the element.
	Elements that subscribe to Lsc instance view model in domain model are required to implement this methods"
	
	self lscInstanceViewModel unsubscribe: self
]

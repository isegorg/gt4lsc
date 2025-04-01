Class {
	#name : #GtLscInstanceElement,
	#superclass : #BrVerticalPane,
	#traits : 'TGtWithLscInstanceViewModel',
	#classTraits : 'TGtWithLscInstanceViewModel classTrait',
	#instVars : [
		'locationElement',
		'nameElement'
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
				border: (BlBorder paint: (Color blue) width: GtLscConstants locationLineWidth));
			addStyle: (BlElementStyle new
				state: BlElementHotState uniqueInstance not;
				border: (BlBorder builder
					dashed;
					paint: Color red;
					width: GtLscConstants locationLineWidth;
					build)) ].
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

{ #category : #initialization }
GtLscInstanceElement >> onAcceptNewTitleWish: aWish [ 
]

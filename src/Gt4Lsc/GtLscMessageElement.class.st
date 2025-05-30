Class {
	#name : #GtLscMessageElement,
	#superclass : #BlElement,
	#traits : 'TGtLscWithModel',
	#classTraits : 'TGtLscWithModel classTrait',
	#instVars : [
		'firstAnchor',
		'secondAnchor',
		'thirdAnchor',
		'fourthAnchor',
		'referenceTextElement',
		'referenceFromInstanceElement',
		'referenceToInstanceElement',
		'fromInstanceLine',
		'returnLine',
		'toInstanceLine',
		'perpendicularAnchor',
		'textElement'
	],
	#classVars : [
		'lineElement',
		'textElement'
	],
	#category : #'Gt4Lsc-! Views'
}

{ #category : #'private - finding' }
GtLscMessageElement >> findInstanceElementWithId: aBlElementId [
	^ self
		allParentsDetect: [ :p | p id = GtLscConstants canvasesContainerElementId asBlocElementId ]
		ifFound: [ :p | 
			p childNamed: aBlElementId asBlocElementId ]
		ifNone: [ BlElement new id: #nonExistent ]
]

{ #category : #'private - finding' }
GtLscMessageElement >> findLocationLineForInstanceElement: aBlElementId [
	^ aBlElementId
		childNamed: GtLscConstants locationLineId
		ifFound: [ :e | e ]
		ifNone: [ BlElement new ]
]

{ #category : #'private - finding' }
GtLscMessageElement >> findLocationLineForInstanceElementWithId: aBlElementId [
	^ self
		allParentsDetect: [ :p | p id = GtLscConstants canvasesContainerElementId asBlocElementId ]
		ifFound: [ :p | 
			(p childNamed: aBlElementId asBlocElementId)
				childNamed: GtLscConstants locationLineId ]
		ifNone: [  ]
]

{ #category : #initialization }
GtLscMessageElement >> initialize [
	super initialize.

	self
		layout: BlFrameLayout new;
		constraintsDo: [ :c | c horizontal matchParent ];
		border: Color black;
		height: 150;
		id: #messageElement.
	self initializeReferencesElement.
	self initializeMessageElements
]

{ #category : #initialization }
GtLscMessageElement >> initializeMessageElements [
	self initializeMessageLineElements.
	self initializeMessageTextElement.
	self updateMessageElementsForInstanceElementId: #nonExistent
]

{ #category : #initialization }
GtLscMessageElement >> initializeMessageLineElements [
	fromInstanceLine := BlLineElement new id: GtLscConstants fromInstanceLineId.

	returnLine := BlLineElement new id: GtLscConstants returnLineId.

	toInstanceLine := BlLineElement new id: GtLscConstants toInstanceLineId.
	self messageLineElementsDo: [ :messageLineElement | 
			messageLineElement states addState: GtLscConstants defaultTemperatureState.
			messageLineElement
				withStylesDo: [ :theStyles | 
					theStyles
						addStyle: (BlElementStyle new
								state: GtLscHotElementState uniqueInstance;
								border: (GtLscConstants hotBorder copyWithWidth: GtLscConstants messageLinesWidth));
						addStyle: (BlElementStyle new
								state: GtLscHotElementState uniqueInstance not;
								border: (GtLscConstants coldBorder copyWithWidth: GtLscConstants messageLinesWidth)) ] ].
	self addChildren: self messageLineElements
]

{ #category : #initialization }
GtLscMessageElement >> initializeMessageTextElement [

	textElement := GtLscAnchoredLabelElement text: ''.
	textElement id: #label.
	perpendicularAnchor := (BlElementCenterAnchor element: self).
	textElement centerAnchor: perpendicularAnchor.
	self addChild: textElement
]

{ #category : #initialization }
GtLscMessageElement >> initializeReferencesElement [
	referenceTextElement := BlElement new
			constraintsDo: [ :c | 
				c vertical exact: 50.
				c frame vertical alignTop.
				c frame horizontal alignRight ];
			id: #referenceForText;
			yourself.
	referenceFromInstanceElement := BlElement new
			constraintsDo: [ :c | 
				c vertical exact: 50.
				c frame vertical alignCenter.
				c frame horizontal alignRight ];
			id: #referenceFor_fromInstanceLine;
			yourself.
	referenceToInstanceElement := BlElement new
			constraintsDo: [ :c | 
				c vertical exact: 50.
				c frame vertical alignBottom.
				c frame horizontal alignRight ];
			id: #referenceFor_toInstanceLine;
			yourself.
	self addChild: referenceTextElement.
	self addChild: referenceFromInstanceElement.
	self addChild: referenceToInstanceElement
]

{ #category : #'as yet unclassified' }
GtLscMessageElement >> messageLineElements [
	^ {fromInstanceLine.
		returnLine.
		toInstanceLine}
]

{ #category : #api }
GtLscMessageElement >> messageLineElementsDo: aBlock [
	self messageLineElements do: [ :messageLine | aBlock cull: messageLine ]
]

{ #category : #'events handling' }
GtLscMessageElement >> onElementIdChanged [
	self id: self model elementId
]

{ #category : #'events handling' }
GtLscMessageElement >> onInstanceElementIdChanged [
	self
		updateMessageElementsForInstanceElementId: self  model instanceId
]

{ #category : #'api - model' }
GtLscMessageElement >> onModelChanged [
	"Is sent when a new Lsc Instance View Model is assigned to the receiver"
	
	self onInstanceElementIdChanged.
	self onTextChanged.
	self onTemperatureStateChanged.
	self onElementIdChanged
]

{ #category : #'events handling' }
GtLscMessageElement >> onTemperatureStateChanged [
	self
		messageLineElementsDo: [ :messageLine | messageLine states addState: self model temperatureState ]
]

{ #category : #'events handling' }
GtLscMessageElement >> onTextChanged [
	textElement text: self model text
]

{ #category : #initialization }
GtLscMessageElement >> updateAnchorsForInstanceElement: aGtLscInstanceElement [
	| locationLineElement |
	locationLineElement := self findLocationLineForInstanceElement: aGtLscInstanceElement.
	firstAnchor := GtLscClosestPositionBoundsAnchor
			nearestTo: referenceFromInstanceElement
			from: locationLineElement.
	secondAnchor := GtLscClosestPositionBoundsAnchor
			nearestTo: referenceFromInstanceElement
			from: aGtLscInstanceElement.

	thirdAnchor := GtLscClosestPositionBoundsAnchor
			nearestTo: referenceToInstanceElement
			from: aGtLscInstanceElement.
	fourthAnchor := GtLscClosestPositionBoundsAnchor
			nearestTo: referenceToInstanceElement
			from: locationLineElement.
	(aGtLscInstanceElement id = #nonExistent asBlocElementId) ifTrue: [ ^ self ].
	perpendicularAnchor := BlPerpendicularAnchor new.	"order of the reference anchors matters"
	perpendicularAnchor
		referenceAnchors: {firstAnchor.
				secondAnchor}.	"the length of a perpendicular is half of the distance"
	perpendicularAnchor curvature: 50.
]

{ #category : #initialization }
GtLscMessageElement >> updateAnchorsForInstanceElementId: aBlElementId [
	| instanceElement |

	instanceElement := self findInstanceElementWithId: aBlElementId.
	
	self updateAnchorsForInstanceElement: instanceElement.
]

{ #category : #initialization }
GtLscMessageElement >> updateMessageElementsForInstanceElementId: anInstanceElementId [
	self updateAnchorsForInstanceElementId: anInstanceElementId.
	fromInstanceLine
			fromAnchor: firstAnchor;
			toAnchor: secondAnchor.

	returnLine
			fromAnchor: secondAnchor;
			toAnchor: thirdAnchor.

	toInstanceLine
			fromAnchor: thirdAnchor;
			toAnchor: fourthAnchor.

	textElement centerAnchor: perpendicularAnchor
]

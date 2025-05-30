Class {
	#name : #GtLscAnchoredLabelElement,
	#superclass : #BlAnchoredElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'centerAnchor',
		'label'
	],
	#category : #'Gt4Lsc-Helpers'
}

{ #category : #initialization }
GtLscAnchoredLabelElement class >> defaultCenterAnchor [
	^ BlAbsolutePositionAnchor position: 100@100
]

{ #category : #'instance  creation' }
GtLscAnchoredLabelElement class >> text: aString [
	| instance |
	instance := self new.
	instance addChild: (BrEditableLabel new
				hFitContentLimited;
				vFitContent;
				aptitude: BrGlamorousRegularEditorAptitude + BrGlamorousEditorSpacingAptitude;
				constraintsDo: [ :c1 | c1 linear horizontal alignCenter ];
				id: GtLscConstants messageTextElementId;
				text: aString).
	instance hFitContent.
	instance vFitContent.
	^ instance
]

{ #category : #'anchor - accessing' }
GtLscAnchoredLabelElement >> centerAnchor [
	^ centerAnchor
]

{ #category : #'anchor - accessing' }
GtLscAnchoredLabelElement >> centerAnchor: aBlGeometryAnchor [

	centerAnchor := aBlGeometryAnchor.
	self registerAnchor: aBlGeometryAnchor
]

{ #category : #'anchor - geometry' }
GtLscAnchoredLabelElement >> centerPosition [
	<return: #Point>
	
	^ self centerAnchor positionWithin: self
]

{ #category : #initialization }
GtLscAnchoredLabelElement >> initialize [
	super initialize.
	
	visuals := BlCustomVisuals new
		geometry: BlRoundedRectangleGeometry new.
	
	centerAnchor := self class defaultCenterAnchor
]

{ #category : #accessing }
GtLscAnchoredLabelElement >> label [
	^ self childAt: 1
]

{ #category : #'api - bounds' }
GtLscAnchoredLabelElement >> labelSize [
	^ self label size
]

{ #category : #layout }
GtLscAnchoredLabelElement >> layoutBounds [
	<return: #Rectangle>
	| aCenterPosition anOrigin aCorner|
	
	aCenterPosition := self centerPosition.
	anOrigin := aCenterPosition - (self labelSize /2).
	aCorner := aCenterPosition + (self labelSize/2).
	
	^ anOrigin corner: aCorner
]

{ #category : #layout }
GtLscAnchoredLabelElement >> measureGeometry [
	| newExtent |
	newExtent := self hasChildren ifTrue: [ (self childAt: 1) extent ] ifFalse: [ (75 @ 75) * 2 ].
	self geometry extent: newExtent
]

{ #category : #accessing }
GtLscAnchoredLabelElement >> text: aString [
	self label text: aString
]

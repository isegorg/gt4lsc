Class {
	#name : #GtLscConstants,
	#superclass : #Object,
	#category : #'Gt4Lsc-Helpers'
}

{ #category : #'api - constants' }
GtLscConstants class >> canvasesContainerElementId [
	^ #canvasesContainer
]

{ #category : #'api - constants' }
GtLscConstants class >> coldBorder [
	^ BlBorder builder
		dashed;
		paint: self coldColor;
		build
]

{ #category : #'api - constants' }
GtLscConstants class >> coldColor [
	^ Color blue
]

{ #category : #'api - constants' }
GtLscConstants class >> defaultTemperatureState [
	^ GtLscHotElementState uniqueInstance
]

{ #category : #'api - constants' }
GtLscConstants class >> fromInstanceLineId [
	^ #fromInstanceLine
]

{ #category : #'api - constants' }
GtLscConstants class >> hotBorder [
	^ BlBorder paint: self hotColor
]

{ #category : #'api - constants' }
GtLscConstants class >> hotColor [
	^ Color red
]

{ #category : #'api - constants' }
GtLscConstants class >> instanceElementIdTemplate [
	^ #'instance-{1}'
]

{ #category : #'api - constants' }
GtLscConstants class >> instanceNameElementId [
	^ #nameElement
]

{ #category : #'api - constants' }
GtLscConstants class >> instancesCanvasId [
	^ #instancesCanvas
]

{ #category : #'api - constants' }
GtLscConstants class >> locationElementId [
	^ #locationElement
]

{ #category : #'api - constants' }
GtLscConstants class >> locationLineId [
	^ #locationLine
]

{ #category : #'api - constants' }
GtLscConstants class >> locationLineWidth [
	^ 5
]

{ #category : #'api - constants' }
GtLscConstants class >> messageElementIdTemplate [
	^ #'message-{1}-from-{2}'
]

{ #category : #'api - constants' }
GtLscConstants class >> messageLineElementId [
	^ #messageLine
]

{ #category : #'api - constants' }
GtLscConstants class >> messageLinesWidth [
	^ 5
]

{ #category : #'api - constants' }
GtLscConstants class >> messageTextElementId [
	^ #messageText
]

{ #category : #'api - constants' }
GtLscConstants class >> messagesCanvasContainerDummyElementId [
	^ #HiddenEditableLabelElement
]

{ #category : #'api - constants' }
GtLscConstants class >> messagesCanvasContainerId [
	^ #messagesCanvasContainer
]

{ #category : #'api - constants' }
GtLscConstants class >> messagesCanvasId [
	^ #messagesCanvas
]

{ #category : #'api - constants' }
GtLscConstants class >> returnLineId [
	^ #returnLine
]

{ #category : #'api - constants' }
GtLscConstants class >> titleElementId [
	^ #title
]

{ #category : #'api - constants' }
GtLscConstants class >> toInstanceLineId [
	^ #toInstanceLine
]

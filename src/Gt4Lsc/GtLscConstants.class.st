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
	^ BlElementHotState uniqueInstance
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

Class {
	#name : #GtLscConstants,
	#superclass : #Object,
	#category : #'Gt4Lsc-Helpers'
}

{ #category : #accessing }
GtLscConstants class >> blElementHotStatePriority [
	^ "UserPriority + 5" 55
]

{ #category : #'api - constants' }
GtLscConstants class >> defaultTemperatureState [
	^ BlElementHotState uniqueInstance
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

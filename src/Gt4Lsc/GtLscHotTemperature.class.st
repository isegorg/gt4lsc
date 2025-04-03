Class {
	#name : #GtLscHotTemperature,
	#superclass : #GtLscTemperature,
	#category : #'Gt4Lsc-! Model'
}

{ #category : #converting }
GtLscHotTemperature class >> asViewState [
	^ BlElementHotState uniqueInstance
]

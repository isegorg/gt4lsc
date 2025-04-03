Class {
	#name : #GtLscColdTemperature,
	#superclass : #GtLscTemperature,
	#category : #'Gt4Lsc-! Model'
}

{ #category : #converting }
GtLscColdTemperature class >> asViewState [
	^ BlElementHotState uniqueInstance not
]

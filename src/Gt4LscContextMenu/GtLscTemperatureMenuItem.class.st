Class {
	#name : #GtLscTemperatureMenuItem,
	#superclass : #GtLscSelectableMenuItem,
	#traits : 'TGtWithLscInstanceModel',
	#classTraits : 'TGtWithLscInstanceModel classTrait',
	#instVars : [
		'color'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'instance creation' }
GtLscTemperatureMenuItem class >> temperature: aGtLscTemperature [
	^ self new color: aGtLscTemperature color
]

{ #category : #accessing }
GtLscTemperatureMenuItem >> color [
	^ color
]

{ #category : #accessing }
GtLscTemperatureMenuItem >> color: aColor [
	color := aColor
]

{ #category : #converting }
GtLscTemperatureMenuItem >> createElement [
	<return: #BlElement or: nil>
	^ GtLscTemperatureElement forMenuItem: self
]

{ #category : #'api - lsc instance model' }
GtLscTemperatureMenuItem >> onLscInstanceModelChanged [
	"Is sent when a new lsc instance model is assigned to the view model"
	
	self onTemperatureChanged
]

{ #category : #'events handling' }
GtLscTemperatureMenuItem >> onTemperatureChanged [
	| newTemperature |
	newTemperature := lscInstanceModel temperature.
	selectionState := newTemperature color = color
			ifTrue: BlElementState selected
			ifFalse: BlElementState deselected
]

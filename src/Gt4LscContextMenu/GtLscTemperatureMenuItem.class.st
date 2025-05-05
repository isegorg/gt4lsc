Class {
	#name : #GtLscTemperatureMenuItem,
	#superclass : #GtLscSelectableMenuItem,
	#traits : 'TGtWithLscInstanceModel',
	#classTraits : 'TGtWithLscInstanceModel classTrait',
	#instVars : [
		'color',
		'temperature'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #converting }
GtLscTemperatureMenuItem class >> elementClass [
	<return: #'BlElement class' with: #TGtLscMenuItemElement>
	^ GtLscTemperatureElement
]

{ #category : #'instance creation' }
GtLscTemperatureMenuItem class >> temperature: aGtLscTemperature [
	^ self new
		temperature: aGtLscTemperature;
		color: aGtLscTemperature color;
		yourself
]

{ #category : #accessing }
GtLscTemperatureMenuItem >> color [
	^ color
]

{ #category : #accessing }
GtLscTemperatureMenuItem >> color: aColor [
	color := aColor
]

{ #category : #api }
GtLscTemperatureMenuItem >> doSelectionAction [
	"The action to be executed when its view is clicked (BlClickEvent)"
	lscInstanceModel temperature: temperature
]

{ #category : #converting }
GtLscTemperatureMenuItem >> elementId [
	<return: #BlElementId>

	^ '{1} - {2}' format: {super elementId asSymbol . color}
]

{ #category : #'api - lsc instance model' }
GtLscTemperatureMenuItem >> onLscInstanceModelChanged [
	"Is sent when a new lsc instance model is assigned to the view model"
	
	self onTemperatureChanged
]

{ #category : #'events handling' }
GtLscTemperatureMenuItem >> onTemperatureChanged [
	| newTemperature newSelectionState |
	newTemperature := lscInstanceModel temperature.
	newSelectionState := newTemperature color = color
			ifTrue: BlElementState selected
			ifFalse: BlElementState deselected.
	self selectionState: newSelectionState
]

{ #category : #'api - lsc instance model' }
GtLscTemperatureMenuItem >> subscribeToLscInstanceModel [
	"Is sent after a new lsc instance model is assigned to the view model.
	It is required to unsubscribe from the domain model by implementing
	#unsubscribeFromLscInstanceModel if view model subscribes to them"

	self lscInstanceModel weak
		when: GtLscInstanceModelTemperatureChanged
		send: #onTemperatureChanged
		to: self
]

{ #category : #acccessing }
GtLscTemperatureMenuItem >> temperature: aGtLscTemperature [
	temperature := aGtLscTemperature
]

{ #category : #'api - lsc instance model' }
GtLscTemperatureMenuItem >> unsubscribeFromLscInstanceModel [
	"Is sent before a new lsc instance model is assigned to the view model.
	View models that subscribe to lsc instance model are required to implement this methods"
	
	self lscInstanceModel unsubscribe: self
]

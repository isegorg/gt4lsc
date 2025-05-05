Class {
	#name : #GtLscTemperatureElement,
	#superclass : #GtLscSelectableElement,
	#traits : 'TGtWithLscInstanceViewModel',
	#classTraits : 'TGtWithLscInstanceViewModel classTrait',
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
GtLscTemperatureElement class >> menuItemClass [
	<return: #'GtLscMenuItem class'>
	^ GtLscTemperatureMenuItem
]

{ #category : #initialization }
GtLscTemperatureElement >> initialize [
	super initialize.

	self
		size: 16 @ 16;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 3)
]

{ #category : #accessing }
GtLscTemperatureElement >> item: aGtLscTemperatureMenuItem [

	super item: aGtLscTemperatureMenuItem.
	self lscInstanceViewModel: aGtLscTemperatureMenuItem
]

{ #category : #'api - lsc instance view model' }
GtLscTemperatureElement >> onLscInstanceViewModelChanged [
	"Is sent when a new Lsc instance view model is assigned to the element"
	
	self background: (lscInstanceViewModel color).
	self onSelectionStateChanged
]

{ #category : #'api - lsc instance view model' }
GtLscTemperatureElement >> subscribeToLscInstanceViewModel [
	"Is sent after a new Lsc instance view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromLscInstanceViewModel if elements subscribe to them"
	
	self lscInstanceViewModel weak
		when: GtLscSelectionStateChanged
			send: #onSelectionStateChanged
			to: self.
]

{ #category : #'api - lsc instance view model' }
GtLscTemperatureElement >> unsubscribeFromLscInstanceViewModel [
	"Is sent before a new Lsc instance view model is assigned to the element.
	Elements that subscribe to Lsc instance view model in domain model are required to implement this methods"
	
	self lscInstanceViewModel unsubscribe: self
]

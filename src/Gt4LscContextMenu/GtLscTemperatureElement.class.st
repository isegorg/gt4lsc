Class {
	#name : #GtLscTemperatureElement,
	#superclass : #BlElement,
	#traits : 'TGtWithLscInstanceViewModel + TGtLscMenuItemElement',
	#classTraits : 'TGtWithLscInstanceViewModel classTrait + TGtLscMenuItemElement classTrait',
	#category : #'Gt4LscContextMenu-! Views'
}

{ #category : #'instance creation' }
GtLscTemperatureElement class >> createInstanceForMenuItem: aGtLscTemperatureMenuItem [
	<return: #BlElement>
	^ self basicNew initialize lscInstanceViewModel: aGtLscTemperatureMenuItem
]

{ #category : #api }
GtLscTemperatureElement class >> deselectedBorder [
	^ BlBorder empty
]

{ #category : #'instance creation' }
GtLscTemperatureElement class >> menuItemClass [
	<return: #'GtLscMenuItem class'>
	^ GtLscTemperatureMenuItem
]

{ #category : #api }
GtLscTemperatureElement class >> selectedBorder [
	^ BlBorder paint: Color black width: 3
]

{ #category : #initialization }
GtLscTemperatureElement >> initialize [
	super initialize.

	self
		size: 16 @ 16;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 3);
		withStylesDo: [ :theStyles |
		theStyles
			addStyle: (BlElementStyle new
				state: BlElementState selected;
				border: self class selectedBorder );
			addStyle: (BlElementStyle new
				state: BlElementState selected not;
				border: self class deselectedBorder) ].
]

{ #category : #'api - lsc instance view model' }
GtLscTemperatureElement >> onLscInstanceViewModelChanged [
	"Is sent when a new Lsc instance view model is assigned to the element"
	
	self background: (lscInstanceViewModel color).
	self onSelectionStateChanged
]

{ #category : #'events handling' }
GtLscTemperatureElement >> onSelectionStateChanged [
	self states addState: self lscInstanceViewModel selectionState
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

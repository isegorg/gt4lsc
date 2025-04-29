Class {
	#name : #GtLscInstancesCanvasElement,
	#superclass : #BrHorizontalGrid,
	#traits : 'TGtWithLscViewModel',
	#classTraits : 'TGtWithLscViewModel classTrait',
	#category : #'Gt4Lsc-! Views'
}

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> addInstanceElementFor: aLscInstanceViewModel [
	^ self addChild: (self createLscInstanceViewFor: aLscInstanceViewModel)
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> addInstanceElementFor: aLscInstanceViewModel atPosition: anInteger [
	^ self
		addChild: (self createLscInstanceViewFor: aLscInstanceViewModel)
		at: anInteger
]

{ #category : #initialization }
GtLscInstancesCanvasElement >> createLscInstanceViewFor: aLscInstanceViewModel [ 
	^ GtLscInstanceElement new
		lscInstanceViewModel: aLscInstanceViewModel
]

{ #category : #initialization }
GtLscInstancesCanvasElement >> initialize [
	super initialize.
	
	self matchParent
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> moveInstanceElementFor: aLscInstanceViewModel toPosition: anInteger [
	self
		childNamed: aLscInstanceViewModel elementId
		ifFound: [ :aLscInstanceElement |
			aLscInstanceElement removeFromParent.
			self addChild: aLscInstanceElement at: anInteger ]
		ifNone: [ "do nothing, no need to raise an exception" ]
]

{ #category : #'events handling' }
GtLscInstancesCanvasElement >> onInstanceAdded: aGtLscInstanceViewModelAdded [
	"Is sent when a new Lsc instance view model is added to the lsc view model"

	"Add a new lsc instance element at a position"

	self
		addInstanceElementFor: aGtLscInstanceViewModelAdded lscInstanceViewModel
		atPosition: aGtLscInstanceViewModelAdded position
]

{ #category : #'events handling' }
GtLscInstancesCanvasElement >> onInstanceMoved: aGtLscInstanceViewModelMoved [
	"Is sent when a new Lsc instance view model is moved to a position in lsc view model"

	"Move a lsc instance element to a position"

	self
		moveInstanceElementFor: aGtLscInstanceViewModelMoved lscInstanceViewModel
		toPosition: aGtLscInstanceViewModelMoved position
]

{ #category : #'events handling' }
GtLscInstancesCanvasElement >> onInstanceRemoved: aGtLscInstanceViewModelRemoved [
	"Is sent when a new Lsc instance view model is removed from the lsc view model"
	"Remove the lsc instance element"
	self removeInstanceElementFor: aGtLscInstanceViewModelRemoved lscInstanceViewModel
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> onLscViewModelChanged [
	"Is sent when a new Lsc view model is assigned to the element"

	self removeChildren.
	self lscViewModel instanceViewModels
		do: [ :eachLscInstanceViewModel | self addInstanceElementFor: eachLscInstanceViewModel ]
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> removeInstanceElementFor: aLscInstanceViewModel [
	self removeChildNamed: aLscInstanceViewModel elementId
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> subscribeToLscViewModel [
	"Is sent after a new Lsc view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromLscViewModel if elements subscribe to them"
	
	self lscViewModel weak
		when: GtLscInstanceViewModelAdded
			send: #onInstanceAdded:
			to: self.
	self lscViewModel weak
		when: GtLscInstanceViewModelRemoved
			send: #onInstanceRemoved:
			to: self.
	self lscViewModel weak
		when: GtLscInstanceViewModelMoved
			send: #onInstanceMoved:
			to: self.
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> unsubscribeFromLscViewModel [
	"Is sent before a new Lsc view model is assigned to the element.
	Elements that subscribe to Lsc view model in domain model are required to implement this methods"
	
	self lscViewModel unsubscribe: self
]

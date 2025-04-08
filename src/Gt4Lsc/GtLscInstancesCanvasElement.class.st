Class {
	#name : #GtLscInstancesCanvasElement,
	#superclass : #BrHorizontalGrid,
	#traits : 'TGtWithLscViewModel',
	#classTraits : 'TGtWithLscViewModel classTrait',
	#category : #'Gt4Lsc-! Views'
}

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

{ #category : #'events handling' }
GtLscInstancesCanvasElement >> onInstanceAdded: aGtLscInstanceViewModelAdded [
	"Is sent when a new Lsc instance view model is added to the lsc view model"
	"Add a new lsc instance element"
	| lscInstanceElement position lscInstanceElementId |
	lscInstanceElement := self createLscInstanceViewFor: aGtLscInstanceViewModelAdded lscInstanceViewModel.
	position := self childrenCount + 1.
	lscInstanceElementId := (GtLscConstants instanceElementIdTemplate format: position asString).
	self addChild: lscInstanceElement as: lscInstanceElementId .
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> onLscViewModelChanged [
	"Is sent when a new Lsc view model is assigned to the element"

	self removeChildren.
	self lscViewModel instanceViewModels doWithIndex: [ :eachLscInstanceViewModel : index |
		| lscInstanceElement lscInstanceElementId |
		lscInstanceElement := self createLscInstanceViewFor: eachLscInstanceViewModel.
		lscInstanceElementId := (GtLscConstants instanceElementIdTemplate format: index asString).
		self addChild: lscInstanceElement as: lscInstanceElementId ].
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> subscribeToLscViewModel [
	"Is sent after a new Lsc view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromLscViewModel if elements subscribe to them"
	
	self lscViewModel weak
		when: GtLscInstanceViewModelAdded
			send: #onInstanceAdded:
			to: self
]

{ #category : #'api - lsc view model' }
GtLscInstancesCanvasElement >> unsubscribeFromLscViewModel [
	"Is sent before a new Lsc view model is assigned to the element.
	Elements that subscribe to Lsc view model in domain model are required to implement this methods"
	
	self lscViewModel unsubscribe: self
]

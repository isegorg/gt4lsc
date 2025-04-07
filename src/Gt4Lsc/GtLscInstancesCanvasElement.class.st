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

Class {
	#name : #GtLscInstanceModelExamples,
	#superclass : #Object,
	#category : #'Gt4Lsc-Examples'
}

{ #category : #'examples - model' }
GtLscInstanceModelExamples >> newLscInstance [
	<gtExample>
	| lscInstance |
	lscInstance := GtLscInstanceModel new.
	self assert: lscInstance name equals: GtLscInstanceModel defaultName.
	self assert: lscInstance temperature equals: GtLscInstanceModel defaultTemperature.
	
	^ lscInstance
]

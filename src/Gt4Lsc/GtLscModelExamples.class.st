Class {
	#name : #GtLscModelExamples,
	#superclass : #Object,
	#category : #'Gt4Lsc-Examples'
}

{ #category : #example }
GtLscModelExamples >> newLsc [
	<gtExample>
	| lsc |
	lsc := GtLscModel new.
	self assert: lsc title equals: GtLscModel defaultTitle
]

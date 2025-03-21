Class {
	#name : #GtLscModelExamples,
	#superclass : #Object,
	#category : #'Gt4Lsc-Examples'
}

{ #category : #'examples - model' }
GtLscModelExamples >> lscChangeTitle [
	<gtExample>
	| aLsc title |
	aLsc := self newLsc.
	title := 'Empty LSC'.
	aLsc title: title.
	
	self assert: aLsc title equals: title.

	^ aLsc
]

{ #category : #'examples  - model' }
GtLscModelExamples >> newLsc [
	<gtExample>
	| lsc |
	lsc := GtLscModel new.
	self assert: lsc title equals: GtLscModel defaultTitle.
	
	^ lsc
]

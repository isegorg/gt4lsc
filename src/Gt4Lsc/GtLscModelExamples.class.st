Class {
	#name : #GtLscModelExamples,
	#superclass : #Object,
	#category : #'Gt4Lsc-Examples'
}

{ #category : #'as yet unclassified' }
GtLscModelExamples >> lscAddInstanceAtPosition [
	<gtExample>
	| aLsc existingInstance newInstance |
	aLsc := self lscWithInstance.
	existingInstance := aLsc instanceAt: 1.
	newInstance := GtLscInstanceModel new name: 'Instance to add'.
	aLsc addInstance: newInstance atPosition: 1.

	self assert: (aLsc instanceAt: 1) equals: newInstance.
	self assert: (aLsc instanceAt: 2) equals: existingInstance.
	self assert: aLsc instancesSize equals: 2.

	^ aLsc
]

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

{ #category : #'as yet unclassified' }
GtLscModelExamples >> lscMoveInstanceToPosition [
	<gtExample>
	| aLsc firstInstance secondInstance |
	aLsc := self lscAddInstanceAtPosition.
	firstInstance := aLsc instanceAt: 1.
	secondInstance := aLsc instanceAt: 2.
	aLsc moveInstanceFromPosition: 1 to: 2.

	self assert: (aLsc instanceAt: 1) equals: secondInstance.
	self assert: (aLsc instanceAt: 2) equals: firstInstance.
	self assert: aLsc instancesSize equals: 2.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscRemoveInstance [
	<gtExample>
	| aLsc anInstance |
	aLsc := self lscWithInstance.
	anInstance := aLsc instanceAt: 1.
	aLsc removeInstance: anInstance.

	self assert: (aLsc hasInstance: anInstance) not.
	self assert: aLsc instancesSize equals: 0.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscWithInstance [
	<gtExample>
	| aLsc anInstance |
	aLsc := self newLsc.
	anInstance := GtLscInstanceModel new.
	aLsc addInstance: anInstance.
	[ aLsc addInstance: anInstance ] on: Exception do: [ :e | e description = 'Can not add an instance already added' ].

	self assert: (aLsc hasInstance: anInstance).
	self assert: aLsc instancesSize equals: 1.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> newLsc [
	<gtExample>
	| lsc |
	lsc := GtLscModel new.
	self assert: lsc title equals: GtLscModel defaultTitle.
	self assert: lsc instancesSize equals: 0.
	^ lsc
]

Class {
	#name : #GtLscModelExamples,
	#superclass : #Object,
	#category : #'Gt4Lsc-Examples'
}

{ #category : #'examples - model' }
GtLscModelExamples >> lscAddInstanceAtPosition [
	<gtExample>
	| aLsc existingInstance newInstance |
	aLsc := self lscWithInstance.
	existingInstance := aLsc instanceAt: 1.
	newInstance := GtLscInstanceModel new name: 'Instance to add'.
	aLsc addInstance: newInstance atPosition: 1.

	self assert: newInstance hasId.
	self assert: (aLsc instanceAt: 1) equals: newInstance.
	self assert: (aLsc instanceAt: 2) equals: existingInstance.
	self assert: aLsc instancesSize equals: 2.

	^ aLsc
]

{ #category : #'examples - model' }
GtLscModelExamples >> lscMoveInstanceToPosition [
	<gtExample>
	| aLsc initialFirstInstance initialFirstInstanceId initialSecondInstance initialSecondInstanceId finalFirstInstance finalFirstInstanceId finalSecondInstance finalSecondInstanceId |
	aLsc := self lscAddInstanceAtPosition.
	initialFirstInstance := aLsc instanceAt: 1.
	initialFirstInstanceId := initialFirstInstance id.
	initialSecondInstance := aLsc instanceAt: 2.
	initialSecondInstanceId := initialSecondInstance id.
	aLsc moveInstanceFromPosition: 1 to: 2.

	finalFirstInstance := aLsc instanceAt: 1.
	finalFirstInstanceId := finalFirstInstance id.
	finalSecondInstance := aLsc instanceAt: 2.
	finalSecondInstanceId := finalSecondInstance id.
	
	"Check instance positions and instance ids do not change"
	self assert: finalFirstInstance equals: initialSecondInstance.
	self assert: finalFirstInstanceId equals: initialSecondInstanceId.
	self assert: finalSecondInstance equals: initialFirstInstance.
	self assert: finalSecondInstanceId equals: initialFirstInstanceId.
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

	self assert: anInstance hasId not.
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
	
	"Check that Lsc instance has not id if it is not added to a Lsc"
	self assert: anInstance hasId not.
	
	aLsc addInstance: anInstance.
	[ aLsc addInstance: anInstance ] on: Exception do: [ :e | e description = 'Can not add an instance already added' ].

	self assert: anInstance hasId.
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

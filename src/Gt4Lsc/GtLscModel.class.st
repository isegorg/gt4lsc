Class {
	#name : #GtLscModel,
	#superclass : #Object,
	#instVars : [
		'title'
	],
	#category : #'Gt4Lsc-! Model'
}

{ #category : #'default model values' }
GtLscModel class >> defaultTitle [
	^ 'Scenario'
]

{ #category : #'initialization ' }
GtLscModel >> initialize [
	title := self class defaultTitle
]

{ #category : #accessing }
GtLscModel >> title [
	^ title
]

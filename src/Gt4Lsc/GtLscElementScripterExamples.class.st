Class {
	#name : #GtLscElementScripterExamples,
	#superclass : #Object,
	#category : #'Gt4Lsc-Examples'
}

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscWithTitleChanged [
	"Check that ui element shows the model title"

	<gtExample>
	| lsc uiElement newTitle |
	lsc := GtLscModelExamples new newLsc.
	uiElement := lsc asElement.
	
	newTitle := 'Title to check'.
	lsc title: newTitle.
	self assert: (uiElement instVarNamed: #titleElement) text asString equals: lsc title.
	^ uiElement
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderNewLsc [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc uiElement |
	lsc := GtLscModelExamples new newLsc.
	uiElement := lsc asElement.
	
	"Check title"
	self assert: (uiElement instVarNamed: #titleElement) text asString equals: lsc title.
	^ uiElement
]

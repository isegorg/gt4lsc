Class {
	#name : #GtLscElementScripterExamples,
	#superclass : #Object,
	#category : #'Gt4Lsc-Examples'
}

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> pipelineLscChangeTitle [
	"Check that ui title change update the model"
	
	<gtExample>
	| uiElement titleElement lsc newTitle |
	uiElement := self renderNewLsc.
	lsc := uiElement lscViewModel lscModel.
	titleElement := uiElement instVarNamed: #titleElement.
	
	newTitle := 'New Scenario Title'.
	self assert: [ (uiElement titleString) ~= newTitle ].
	
	titleElement switchToEditor.
	
	self assert: titleElement isEditable.
	self assert: titleElement viewModel model asString equals: titleElement text asString.
	
	titleElement text
		deleteAll;
		append: newTitle asRopedText.
		
	titleElement acceptEdition.
	
	"the original text is stored in order to be restored if edition cancelled"
	self assert: titleElement text asString equals: newTitle.
	self assert: lsc title equals: newTitle.
	
	^ uiElement
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscWithTitleChanged [
	"Check that ui element shows the model title change"

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

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderNewLscInstance [
	"Check that the LscInstance UI element displays the model's characteristics"

	<gtExample>
	| lscInstance uiElement |
	lscInstance := GtLscInstanceModelExamples new newLscInstance.
	uiElement := lscInstance asElement.
	
	"Check title"
	self assert: (uiElement instVarNamed: #nameElement) text asString equals: lscInstance name.
	"Check locationLine border"
	^ uiElement
]

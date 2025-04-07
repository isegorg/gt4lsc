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
GtLscElementScripterExamples >> pipelineLscInstanceChangeName [
	"Check that ui name change update the model"
	
	<gtExample>
	| uiElement nameElement lscInstance newName |
	uiElement := self renderNewLscInstance.
	lscInstance := uiElement lscInstanceViewModel lscInstanceModel.
	nameElement := uiElement instVarNamed: #nameElement.
	
	newName := 'New Lsc Instance Name'.
	self assert: [ nameElement text asString ~= newName ].
	
	nameElement switchToEditor.
	
	self assert: nameElement isEditable.
	self assert: nameElement viewModel model asString equals: nameElement text asString.
	
	nameElement text
		deleteAll;
		append: newName asRopedText.
		
	nameElement acceptEdition.
	
	"the original text is stored in order to be restored if edition cancelled"
	self assert: nameElement text asString equals: newName.
	self assert: lscInstance name equals: newName.
	
	^ uiElement
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscInstanceWithChanges [
	"Check that ui element shows the model changes"

	<gtExample>
	| lscInstance uiElement newName newTemperature |
	lscInstance := GtLscInstanceModelExamples new newLscInstance.
	uiElement := lscInstance asElement.
	
	newName := 'Name to check'.
	lscInstance name: newName.
	newTemperature := GtLscColdTemperature.
	lscInstance temperature: newTemperature.
	
	"Check name"
	self assert: (uiElement instVarNamed: #nameElement) text asString equals: lscInstance name.
	"Check locationLine border"
		self assert: uiElement locationLineElement border paint equals: GtLscConstants coldColor asBlPaint.
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
	
	"Check title"
	self assert: (uiElement instVarNamed: #titleElement) text asString equals: lsc title.
	^ uiElement
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderNewLsc [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc uiElement instancesCanvasElement |
	lsc := GtLscModelExamples new newLsc.
	uiElement := lsc asElement.
	
	"Check title"
	self assert: (uiElement instVarNamed: #titleElement) text asString equals: lsc title.
	"Check the instance in the view"
	instancesCanvasElement := (uiElement childNamed: GtLscConstants instancesCanvasId).
	self assert: instancesCanvasElement isNotNil.
	self assert: instancesCanvasElement childrenCount equals: 0.
	^ uiElement
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderNewLscInstance [
	"Check that the LscInstance UI element displays the model's characteristics"

	<gtExample>
	| lscInstance uiElement |
	lscInstance := GtLscInstanceModelExamples new newLscInstance.
	uiElement := lscInstance asElement.
	
	"Check name"
	self assert: (uiElement instVarNamed: #nameElement) text asString equals: lscInstance name.
	"Check locationLine border"
	self assert: uiElement locationLineElement border paint equals: GtLscConstants hotColor asBlPaint.
	
	^ uiElement
]

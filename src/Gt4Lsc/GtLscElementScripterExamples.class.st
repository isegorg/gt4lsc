Class {
	#name : #GtLscElementScripterExamples,
	#superclass : #Object,
	#category : #'Gt4Lsc-Examples'
}

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> pipelineLscChangeTitle [
	"Check that ui title change update the model"
	
	<gtExample>
	| lsc uiElement titleElement newTitle |
	lsc := self renderNewLsc.
	uiElement := lsc asElement.
	titleElement := uiElement childNamed: GtLscConstants titleElementId.
	
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
	| lscInstance uiElement nameElement newName |
	lscInstance := self renderNewLscInstance.
	uiElement := lscInstance asElement.
	nameElement := uiElement childNamed: GtLscConstants instanceNameElementId.
	
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
	
	^ lscInstance
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscAddingInstance [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc uiElement instancesCanvasElement initialInstancesSize instanceAdded instanceAddedPosition instanceAddedElement |
	lsc := self renderNewLsc.
	initialInstancesSize := lsc instancesSize.
	uiElement := lsc asElement.
	
	"Add an instance to the model"
	instanceAdded := GtLscInstanceModelExamples new newLscInstance
		name: 'Instance added';
		temperature: GtLscColdTemperature;
		yourself.
	lsc addInstance: instanceAdded.
	
	instanceAddedPosition := initialInstancesSize + 1.
	
	"Check the instance in the view"
	instancesCanvasElement := (uiElement childNamed: GtLscConstants instancesCanvasId).
	self assert: instancesCanvasElement isNotNil.
	self assert: instancesCanvasElement childrenCount equals: instanceAddedPosition.
	
	instanceAddedElement := (instancesCanvasElement childAt: instanceAddedPosition).
	"Check element id"
	self assert: instanceAddedElement id equals: (GtLscConstants instanceElementIdTemplate format: {instanceAdded id asString}) asBlocElementId.
	"Check name"
	self assert: (instanceAddedElement childNamed: #nameElement) text asString equals: instanceAdded name.
	"Check locationLine border"
	"self assert: instanceAddedElement border paint equals: GtLscConstants coldColor asBlPaint."

	^ lsc
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscAddingInstanceAtPosition [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc initialInstancesSize uiElement positionWhereToAdd initialPriorInstanceElement initialLaterInstanceElement instanceAdded instancesCanvasElement instanceAddedElement finalPriorInstanceElement finalLaterInstanceElement |
	lsc := self renderLscWithInstances.
	initialInstancesSize := lsc instancesSize.
	uiElement := lsc asElement.
	
	positionWhereToAdd := initialInstancesSize.
	instancesCanvasElement := (uiElement childNamed: GtLscConstants instancesCanvasId).
	initialPriorInstanceElement := (instancesCanvasElement childAt: positionWhereToAdd - 1).
	initialLaterInstanceElement := (instancesCanvasElement childAt: positionWhereToAdd).
	"Add an instance to the model at position"
	instanceAdded := GtLscInstanceModelExamples new newLscInstance
		name: 'Instance added at position';
		temperature: GtLscColdTemperature;
		yourself.
	lsc addInstance: instanceAdded atPosition: positionWhereToAdd.
	
	"Check the instance in the view"
	self assert: instancesCanvasElement isNotNil.
	self assert: instancesCanvasElement childrenCount equals: initialInstancesSize + 1.
	
	instanceAddedElement := (instancesCanvasElement childAt: positionWhereToAdd).
	"Check element id"
	self assert: instanceAddedElement id equals: (GtLscConstants instanceElementIdTemplate format: {instanceAdded id asString}) asBlocElementId.
	"Check name"
	self assert: (instanceAddedElement childNamed: #nameElement) text asString equals: instanceAdded name.
	"Check locationLine border"
	"self assert: instanceAddedElement border paint equals: GtLscConstants coldColor asBlPaint."
	
	"Check the prior instance in the view"
	finalPriorInstanceElement := (instancesCanvasElement childAt: positionWhereToAdd - 1).
	"Check element id"
	self assert: initialPriorInstanceElement id equals: finalPriorInstanceElement id.
	"Check name"
	self assert: (initialPriorInstanceElement childNamed: #nameElement) text equals: (finalPriorInstanceElement childNamed: #nameElement) text.
	"Check locationLine border"
	self assert: initialPriorInstanceElement border paint equals: finalPriorInstanceElement border paint.
	
	"Check the later instance in the view"
	finalLaterInstanceElement := (instancesCanvasElement childAt: positionWhereToAdd + 1).
	"Check element id"
	self assert: initialLaterInstanceElement id equals: finalLaterInstanceElement id.
	"Check name"
	self assert: (initialLaterInstanceElement childNamed: #nameElement) text equals: (finalLaterInstanceElement childNamed: #nameElement) text.
	"Check locationLine border"
	self assert: initialLaterInstanceElement border paint equals: finalLaterInstanceElement border paint.

	^ lsc
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscInstanceWithChanges [
	"Check that ui element shows the model changes"

	<gtExample>
	| lscInstance uiElement newName newTemperature newId |
	lscInstance := self renderNewLscInstance.
	uiElement := lscInstance asElement.
	
	newName := 'Name to check'.
	lscInstance name: newName.
	newTemperature := GtLscColdTemperature.
	lscInstance temperature: newTemperature.
	newId := 'New Id'.
	lscInstance id: newId.
	
	"Check name"
	self assert: (uiElement childNamed: GtLscConstants instanceNameElementId) text asString equals: lscInstance name.
	"Check locationLine border"
	"self assert: uiElement locationLineElement border paint equals: GtLscConstants coldColor asBlPaint."
	"Check element id"
	self assert: uiElement id equals: (GtLscConstants instanceElementIdTemplate format: {lscInstance id asString}) asBlocElementId.
	^ lscInstance
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscMovingInstanceToPosition [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc initialInstancesSize uiElement instancesCanvasElement initialFirstInstance initialFirstInstanceElement initialSecondInstance initialSecondInstanceElement initialThirdInstance initialThirdInstanceElement finalFirstInstanceElement finalSecondInstanceElement finalThirdInstanceElement|
	lsc := self renderLscAddingInstanceAtPosition.
	initialInstancesSize := lsc instancesSize.
	uiElement := lsc asElement.
	instancesCanvasElement := (uiElement childNamed: GtLscConstants instancesCanvasId).
	initialFirstInstance := lsc instanceAt: 1.
	initialFirstInstanceElement := (instancesCanvasElement childAt: 1).
	initialSecondInstance := lsc instanceAt: 2.
	initialSecondInstanceElement := (instancesCanvasElement childAt: 2).
	initialThirdInstance := lsc instanceAt: 3.
	initialThirdInstanceElement := (instancesCanvasElement childAt: 3).
	
	"Move an instance to position"
	lsc moveInstanceFromPosition: 2 to: 1.
	
	finalFirstInstanceElement := (instancesCanvasElement childAt: 1).
	finalSecondInstanceElement := (instancesCanvasElement childAt: 2).
	finalThirdInstanceElement := (instancesCanvasElement childAt: 3).
	
	"Check that the first final instance element is the second initial instance element"
	"Check element id"
	self assert: finalFirstInstanceElement id equals: initialSecondInstanceElement id.
	"Check name"
	self assert: (finalFirstInstanceElement childNamed: #nameElement) text equals: (initialSecondInstanceElement childNamed: #nameElement) text.
	"Check locationLine border"
	self assert: finalFirstInstanceElement border paint equals: initialSecondInstanceElement border paint.
	
	"Check that the second final instance element is the first initial instance element"
	"Check element id"
	self assert: finalSecondInstanceElement id equals: initialFirstInstanceElement id.
	"Check name"
	self assert: (finalSecondInstanceElement childNamed: #nameElement) text equals: (initialFirstInstanceElement childNamed: #nameElement) text.
	"Check locationLine border"
	self assert: finalSecondInstanceElement border paint equals: initialFirstInstanceElement border paint.

	"Check that the third final instance element remains the same in the view"
	"Check element id"
	self assert: finalThirdInstanceElement id equals: initialThirdInstanceElement id.
	"Check name"
	self assert: (finalThirdInstanceElement childNamed: #nameElement) text equals: (initialThirdInstanceElement childNamed: #nameElement) text.
	"Check locationLine border"
	self assert: finalThirdInstanceElement border paint equals: initialThirdInstanceElement border paint.
	
	^ lsc
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscRemovingInstance [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc uiElement instanceToRemove instanceToRemoveElementId instancesCanvasElement initialInstancesSize |
	lsc := self renderLscAddingInstance.
	initialInstancesSize := lsc instancesSize.
	uiElement := lsc asElement.
	
	instancesCanvasElement := (uiElement childNamed: GtLscConstants instancesCanvasId).
	
	"Removing an instance to the model"
	instanceToRemove := lsc instanceAt: initialInstancesSize.
	instanceToRemoveElementId := (GtLscConstants instanceElementIdTemplate format: {instanceToRemove id asString}).
	self assert: (instancesCanvasElement childNamed: instanceToRemoveElementId ifFound: [ :instanceElement | true ] ifNone: false).
	lsc removeInstance: instanceToRemove.
	
	"Check the instance in the view"
	self assert: (instancesCanvasElement childNamed: instanceToRemoveElementId ifFound: [ :instanceElement | false ] ifNone: true).
	self assert: instancesCanvasElement childrenCount equals: initialInstancesSize - 1.
	
	^ lsc
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscWithInstances [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc uiElement instancesCanvasElement firstLscInstance secondLscInstance fistLscInstanceElement secondLscInstanceElement |
	lsc := GtLscModelExamples new lscAddInstanceAtPosition.
	firstLscInstance := lsc instanceAt: 1.
	secondLscInstance := lsc instanceAt: 2.
	uiElement := lsc asElement.
	
	"Check the instance in the view"
	instancesCanvasElement := (uiElement childNamed: GtLscConstants instancesCanvasId).
	self assert: instancesCanvasElement isNotNil.
	self assert: instancesCanvasElement childrenCount equals: lsc instancesSize.
	
	fistLscInstanceElement := (instancesCanvasElement childAt: 1).
	self assert: fistLscInstanceElement id equals: (GtLscConstants instanceElementIdTemplate format: {firstLscInstance id asString}) asBlocElementId.
	self assert: (fistLscInstanceElement childNamed: GtLscConstants instanceNameElementId) text asString equals: firstLscInstance name.
	"self assert: (fistLscInstanceElement childNamed: GtLscConstants locationLineId) border paint equals: GtLscConstants hotColor asBlPaint."
	
	secondLscInstanceElement := (instancesCanvasElement childAt: 2).
	self assert: secondLscInstanceElement id equals: (GtLscConstants instanceElementIdTemplate format: {secondLscInstance id asString}) asBlocElementId.
	self assert: (secondLscInstanceElement childNamed: GtLscConstants instanceNameElementId) text asString equals: secondLscInstance name.
	"self assert: (secondLscInstanceElement childNamed: GtLscConstants locationLineId) border paint equals: GtLscConstants hotColor asBlPaint."
	
	^ lsc
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscWithMessages [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc firstLscMessage secondLscMessage uiElement messagesCanvasElement fistLscMessageElement secondLscMessageElement |
	lsc := GtLscModelExamples new lscAddMessageAtPosition.
	firstLscMessage := lsc messageAt: 1.
	secondLscMessage := lsc messageAt: 2.
	uiElement := lsc asElement.
	
	"Check the messages in the view"
	messagesCanvasElement := (uiElement childNamed: GtLscConstants messagesCanvasId).
	self assert: messagesCanvasElement isNotNil.
	self assert: messagesCanvasElement childrenCount equals: lsc messagesSize.
	
	fistLscMessageElement := (messagesCanvasElement childAt: 1).
	self assert: fistLscMessageElement id equals: (GtLscConstants messageElementIdTemplate format: {firstLscMessage id asString}) asBlocElementId.
	self assert: (fistLscMessageElement childNamed: GtLscConstants messageTextElementId) text asString equals: firstLscMessage text.
	self assert: (fistLscMessageElement childNamed: GtLscConstants messageLineElementId) border paint equals: GtLscConstants hotColor asBlPaint.
	
	secondLscMessageElement := (messagesCanvasElement childAt: 2).
	self assert: secondLscMessageElement id equals: (GtLscConstants messageElementIdTemplate format: {secondLscMessage id asString}) asBlocElementId.
	self assert: (secondLscMessageElement childNamed: GtLscConstants messageTextElementId) text asString equals: secondLscMessage name.
	self assert: (secondLscMessageElement childNamed: GtLscConstants messageLineElementId) border paint equals: GtLscConstants hotColor asBlPaint.
	
	^ lsc
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderLscWithTitleChanged [
	"Check that ui element shows the model title change"

	<gtExample>
	| lsc uiElement newTitle |
	lsc := self renderNewLsc.
	uiElement := lsc asElement.
	
	newTitle := 'Title to check'.
	lsc title: newTitle.
	
	"Check title"
	self assert: (uiElement childNamed: GtLscConstants titleElementId) text asString equals: lsc title.
	^ lsc
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderNewLsc [
	"Check that the UI element displays the model's characteristics"

	<gtExample>
	| lsc uiElement instancesCanvasElement messagesCanvasElement |
	lsc := GtLscModelExamples new newLsc.
	uiElement := lsc asElement.
	
	"Check title"
	self assert: (uiElement childNamed: GtLscConstants titleElementId) text asString equals: lsc title.
	"Check the instance in the view"
	instancesCanvasElement := (uiElement childNamed: GtLscConstants instancesCanvasId).
	self assert: instancesCanvasElement isNotNil.
	self assert: instancesCanvasElement childrenCount equals: 0.
	"Check messages in the view"
	messagesCanvasElement := (uiElement childNamed: GtLscConstants messagesCanvasId).
	self assert: messagesCanvasElement isNotNil.
	self assert: messagesCanvasElement childrenCount equals: 0.
	^ lsc
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderNewLscInstance [
	"Check that the LscInstance UI element displays the model's characteristics"

	<gtExample>
	| lscInstance uiElement locationLine|
	lscInstance := GtLscInstanceModelExamples new newLscInstance id: 'Initial ID'.
	uiElement := lscInstance asElement.
	
	"Check title"
	self assert: (uiElement childNamed: GtLscConstants instanceNameElementId) text asString equals: lscInstance name.
	"Check locationLine border"
	locationLine := uiElement childNamed: GtLscConstants locationLineId.
	"self assert: locationLine border paint equals: GtLscConstants hotColor asBlPaint."
	"Check element id"
	self assert: uiElement id equals: (GtLscConstants instanceElementIdTemplate format: {lscInstance id asString}) asBlocElementId.
	
	^ lscInstance
]

{ #category : #'examples - ui' }
GtLscElementScripterExamples >> renderNewLscMessage [
	"Check that the LscMessage UI element displays the model's characteristics"

	<gtExample>
	| lsc lscMessage uiElement |
	lsc := GtLscModelExamples new lscAddMessage.
	lscMessage := lsc messageAt: 1.
	uiElement := lscMessage asElement.

	"Check id"
	self assert: uiElement id equals: (GtLscConstants messageElementIdTemplate format: {lscMessage id asString . lscMessage instanceId asString}) asBlocElementId.
	"Check text"
	self assert: (uiElement childNamed: GtLscConstants messageTextElementId) text asString equals: lscMessage text.
	"Check temperature"
	self assert: (uiElement childNamed: GtLscConstants messageLineElementId) border paint equals: GtLscConstants hotColor asBlPaint.
	
	^ lscMessage
]

Class {
	#name : #GtLscContextMenuElementScripterExamples,
	#superclass : #Object,
	#category : #'Gt4LscContextMenu-Examples'
}

{ #category : #'examples - ui' }
GtLscContextMenuElementScripterExamples >> addInstanceEditor [
	"Check that LscInstanceEditorElement is added and shown in LscInstanceElement"
	
	<gtExample>
	| lscInstance lscInstanceElement nameElement localPosition |
	lscInstance := GtLscElementScripterExamples new renderNewLscInstance.
	lscInstanceElement := lscInstance asElement.
	lscInstanceElement inspect.
	
	1 second wait.
	"Check that it is displayed when you right-click on nameElement"
	nameElement := lscInstanceElement childNamed: GtLscConstants instanceNameElementId.
	localPosition := 2@2.
	nameElement fireEvent: (BlMouseUpEvent new button: BlMouseButton secondary; position: (nameElement localPointToGlobal: localPosition) ).
	
	self assert: (lscInstanceElement allParentsDetect: [ :aParent | aParent childNamed: #GtLscInstanceEditorElement ifFound: [ :element | true ] ifNone: [ false ]  ] ifFound: [ :detectedParent | true ] ifNone: [ false ]). 
	
	^ lscInstance
]

{ #category : #'examples - ui' }
GtLscContextMenuElementScripterExamples >> pipelineLscInstanceChangeTemperature [
	"Check that ui temperature change update the model"
	
	<gtExample>
	| editor lscInstance oldLscInstanceTemperature container temperaturePicker coldTemperature hotTemperature |
	editor := self renderLscInstanceEditorWithChanges.
	lscInstance := editor lscInstanceViewModel lscInstanceModel.
	oldLscInstanceTemperature := lscInstance temperature.
	container := editor childNamed: #container.
	temperaturePicker := container childAt: 2.
	coldTemperature := temperaturePicker childAt: 1.
	hotTemperature := temperaturePicker childAt: 2.
	
	"Click on hot temperature element"
	hotTemperature eventDispatcher dispatchEvent: BlClickEvent new.
	
	"Check new temperature"
	self assert: (coldTemperature states hasState: BlElementState deselected).
	self assert: (hotTemperature states hasState: BlElementState selected).
	self assert: lscInstance temperature equals: GtLscHotTemperature.
	self assert: (lscInstance temperature = oldLscInstanceTemperature) not.

	^ editor
]

{ #category : #'examples - ui' }
GtLscContextMenuElementScripterExamples >> renderLscInstanceEditorWithChanges [
	"Check that the LscInstanceEditor displays the model's changes"

	<gtExample>
	| editor lscInstance container  newTemperature temperaturePicker coldTemperature hotTemperature |
	editor := self renderNewLscInstanceEditor.
	lscInstance := editor lscInstanceViewModel lscInstanceModel.
	container := editor childNamed: #container.
	
	"Model changes"
	newTemperature := GtLscColdTemperature.
	lscInstance temperature: newTemperature.
	
	"Check temperature actions"
	"Check temperature elements"
	"Check cold temperature element"
	temperaturePicker := container childAt: 2.
	coldTemperature := temperaturePicker childAt: 1.
	self assert: (coldTemperature states hasState: BlElementState selected).
	"Check hot temperature element"
	hotTemperature := temperaturePicker childAt: 2.
	self assert: (hotTemperature states hasState: BlElementState deselected).
	
	^ editor
]

{ #category : #'examples - ui' }
GtLscContextMenuElementScripterExamples >> renderNewLscInstanceEditor [
	"Check that the LscInstanceEditor displays the model's characteristics"

	<gtExample>
	| lscInstance editor container temperatureContainer temperaturePicker coldTemperature hotTemperature |
	lscInstance := GtLscElementScripterExamples new renderNewLscInstance.
	editor := GtLscInstanceEditorElement forModel: lscInstance.
	container := editor childNamed: #container.
	
	"Check temperature actions"
	"Check temperature label element"
	temperatureContainer := container childAt: 1.
	self assert: temperatureContainer id equals: #'GtLscLabelMenuItem - Temperature:' asBlocElementId.
	self assert: temperatureContainer text asString equals: 'Temperature:'.
	"Check temperature picker element"
	temperaturePicker := container childAt: 2.
	self assert: temperaturePicker id equals: #GtLscTemperaturePickerMenuItem asBlocElementId.
	self assert: temperaturePicker childrenCount equals: GtLscTemperature allSubclasses size.
	"Check temperature elements"
	"Check cold temperature element"
	coldTemperature := temperaturePicker childAt: 1.
	self assert: coldTemperature id equals: #'GtLscTemperatureMenuItem - Color blue' asBlocElementId.
	self assert: (coldTemperature states hasState: BlElementState deselected).
	"Check hot temperature element"
	hotTemperature := temperaturePicker childAt: 2.
	self assert: hotTemperature id equals: #'GtLscTemperatureMenuItem - Color red' asBlocElementId.
	self assert: (hotTemperature states hasState: BlElementState selected).
	
	^ editor
]

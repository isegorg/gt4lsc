Class {
	#name : #GtLscContextMenuElementScripterExamples,
	#superclass : #Object,
	#category : #'Gt4LscContextMenu-Examples'
}

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

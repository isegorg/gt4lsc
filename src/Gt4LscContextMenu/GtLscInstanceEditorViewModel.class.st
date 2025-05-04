Class {
	#name : #GtLscInstanceEditorViewModel,
	#superclass : #Object,
	#traits : 'TGtWithLscInstanceModel',
	#classTraits : 'TGtWithLscInstanceModel classTrait',
	#instVars : [
		'contextMenuItems'
	],
	#category : #'Gt4LscContextMenu-! View models'
}

{ #category : #initialization }
GtLscInstanceEditorViewModel >> addTemperatureMenuItems [
	contextMenuItems add: self menuItemTemperatureLabel.
	contextMenuItems add: self menuItemTemperaturePicker.
]

{ #category : #converting }
GtLscInstanceEditorViewModel >> elementList [
	<return: #Collection of: #BlElement>
	^ contextMenuItems collect: [ :item | item createElement ]
]

{ #category : #initialization }
GtLscInstanceEditorViewModel >> initialize [
	super initialize.
	self initializeContextMenuItems
]

{ #category : #initialization }
GtLscInstanceEditorViewModel >> initializeContextMenuItems [
	contextMenuItems := OrderedCollection empty.
	self addTemperatureMenuItems.
]

{ #category : #'api - context menu items' }
GtLscInstanceEditorViewModel >> menuItemTemperatureLabel [
	^ GtLscLabelMenuItem text: 'Temperature:'
]

{ #category : #'api - context menu items' }
GtLscInstanceEditorViewModel >> menuItemTemperaturePicker [
	^ GtLscTemperaturePickerMenuItem new
]

{ #category : #'api - lsc instance model' }
GtLscInstanceEditorViewModel >> onLscInstanceModelChanged [
	"Is sent when a new lsc instance model is assigned to the view model"
	
	self setLscInstanceModelToItems
]

{ #category : #'api - lsc instance model' }
GtLscInstanceEditorViewModel >> setLscInstanceModelToItems [
	contextMenuItems
		select: [ :item | item respondsTo: #lscInstanceModel: ]
		thenDo: [ :item | item lscInstanceModel: lscInstanceModel ]
]

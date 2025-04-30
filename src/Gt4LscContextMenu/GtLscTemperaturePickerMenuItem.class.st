Class {
	#name : #GtLscTemperaturePickerMenuItem,
	#superclass : #GtLscPickerMenuItem,
	#traits : 'TGtWithLscInstanceModel',
	#classTraits : 'TGtWithLscInstanceModel classTrait',
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #initialization }
GtLscTemperaturePickerMenuItem >> addSelectableMenuItems [
	"Add the GtLscTemperatureMenuItem to selectableItems"

	GtLscTemperature
		allSubclassesDo: [ :temperatureClass |
			selectableItems add: (GtLscTemperatureMenuItem temperature: temperatureClass) ]
]

{ #category : #'api - lsc instance model' }
GtLscTemperaturePickerMenuItem >> onLscInstanceModelChanged [
	"Is sent when a new lsc instance model is assigned to the view model"
	
	self setLscInstanceModelToItems
]

{ #category : #'api - lsc instance model' }
GtLscTemperaturePickerMenuItem >> setLscInstanceModelToItems [
	selectableItems
		select: [ :item | item respondsTo: #lscInstanceModel: ]
		thenDo: [ :item | item lscInstanceModel: lscInstanceModel ]
]

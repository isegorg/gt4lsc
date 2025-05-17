Class {
	#name : #GtLscInstanceInLscEditorViewModel,
	#superclass : #GtLscInstanceEditorViewModel,
	#traits : 'TGtLscWithInstanceInLsc',
	#classTraits : 'TGtLscWithInstanceInLsc classTrait',
	#category : #'Gt4LscContextMenu-! View models'
}

{ #category : #initialization }
GtLscInstanceInLscEditorViewModel >> addActionsForInstance: aGtLscInstanceModel inLsc: aGtLscModel [
	contextMenuItems
		add: (GtLscInstanceInLscActionToolbarMenuItem
				forInstance: aGtLscInstanceModel
				inLsc: aGtLscModel)
]

{ #category : #'instance creation' }
GtLscInstanceInLscEditorViewModel >> lscInstance: aGtLscInstanceModel inLsc: aGtLscModel [
	self checkInstance: aGtLscInstanceModel isInLsc: aGtLscModel.
	self addActionsForInstance: aGtLscInstanceModel inLsc: aGtLscModel.
	model := aGtLscModel.
	self lscInstanceModel: aGtLscInstanceModel
]

{ #category : #'api - model' }
GtLscInstanceInLscEditorViewModel >> onModelChanged [
	"Is sent when a new model is assigned to the receiver"
	
	"The model (lsc) can not be changed to another if lsc instance is not in it"
	self checkInstance: lscInstanceModel isInLsc: model.
	self updateInstanceInLscItems
]

{ #category : #'api - lsc instance model' }
GtLscInstanceInLscEditorViewModel >> setLscInstanceModelToItems [
	super setLscInstanceModelToItems.
	self updateInstanceInLscItems
]

{ #category : #'api - lsc instance model' }
GtLscInstanceInLscEditorViewModel >> updateInstanceInLscItems [
	contextMenuItems
		select: [ :item | item respondsTo: #lscInstance:inLsc: ]
		thenDo: [ :item | item lscInstance: lscInstanceModel inLsc: model ]
]

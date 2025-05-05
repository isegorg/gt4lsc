Extension { #name : #GtLscInstanceElement }

{ #category : #'*Gt4LscContextMenu' }
GtLscInstanceElement >> addContextMenu [
	| instanceModel |
	instanceModel := self lscInstanceViewModel lscInstanceModel.
	self childWithEditor
		do: [ :childElement | 
			childElement
				addAptitude: ((BrGlamorousWithContextMenuAptitude
						handle: [ GtLscConstants contextMenuHandler ]
						content: [ GtLscInstanceEditorElement forModel: instanceModel ])
						preferredExtent: GtLscConstants contextMenuPreferredExtent) ]
]

{ #category : #'*Gt4LscContextMenu' }
GtLscInstanceElement >> childWithEditor [
	"Child elements collection to which the aptitude will be added to display the context menu by right-clicking on them."
	^ {nameElement . locationElement}
]

{ #category : #'*Gt4LscContextMenu' }
GtLscInstanceElement >> onAddedToParent [
	super onAddedToParent.
	self addContextMenu
]

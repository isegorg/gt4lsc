Class {
	#name : #GtLscMoveInstanceRightButtonMenuItem,
	#superclass : #GtLscMoveInstanceButtonMenuItem,
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'default values' }
GtLscMoveInstanceRightButtonMenuItem class >> defaultIcon [
	"Overwrite with the icon initialization value"
	^ BrGlamorousIcons right.
]

{ #category : #'default values' }
GtLscMoveInstanceRightButtonMenuItem class >> defaultLabel [
	"Overwrite with the label initialization value"
	^ GtLscConstants moveInstanceRightButtonLabel
]

{ #category : #checking }
GtLscMoveInstanceRightButtonMenuItem >> checkVisibilityCondition [
	"Return true it must be visible or false in other case"

	"Visible if instance is not at last position"

	<return: #Bollean>
	^ ((model instances indexOf: lscInstanceModel) = model instancesSize) not
]

{ #category : #api }
GtLscMoveInstanceRightButtonMenuItem >> doClickAction [
	"The action to be executed when its view is clicked (BlClickEvent)"
	| instancePosition |
	instancePosition := model instances indexOf: lscInstanceModel.
	model moveInstanceFromPosition: instancePosition to: instancePosition + 1
]

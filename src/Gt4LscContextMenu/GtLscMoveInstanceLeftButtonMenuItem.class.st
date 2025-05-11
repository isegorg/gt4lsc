Class {
	#name : #GtLscMoveInstanceLeftButtonMenuItem,
	#superclass : #GtLscMoveInstanceButtonMenuItem,
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #'default values' }
GtLscMoveInstanceLeftButtonMenuItem class >> defaultIcon [
	"Overwrite with the icon initialization value"
	^ BrGlamorousIcons left.
]

{ #category : #'default values' }
GtLscMoveInstanceLeftButtonMenuItem class >> defaultLabel [
	"Overwrite with the label initialization value"
	^ GtLscConstants moveInstanceLeftButtonLabel
]

{ #category : #checking }
GtLscMoveInstanceLeftButtonMenuItem >> checkVisibilityCondition [
	"Return true it must be visible or false in other case"

	"Visible if instance is not at first position"

	<return: #Bollean>
	^ ((model instances indexOf: lscInstanceModel) = 1) not
]

{ #category : #api }
GtLscMoveInstanceLeftButtonMenuItem >> doClickAction [
	"The action to be executed when its view is clicked (BlClickEvent)"
	| instancePosition |
	instancePosition := model instances indexOf: lscInstanceModel.
	model moveInstanceFromPosition: instancePosition to: instancePosition - 1
]

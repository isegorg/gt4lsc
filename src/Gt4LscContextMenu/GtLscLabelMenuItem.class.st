Class {
	#name : #GtLscLabelMenuItem,
	#superclass : #GtLscMenuItem,
	#instVars : [
		'text'
	],
	#category : #'Gt4LscContextMenu-! Items'
}

{ #category : #converting }
GtLscLabelMenuItem class >> elementClass [
	<return: #'BlElement class' with: #TGtLscMenuItemElement>
	^ GtLscLabelElement
]

{ #category : #'instance creation' }
GtLscLabelMenuItem class >> text: aText [
	^ self new text: aText
]

{ #category : #converting }
GtLscLabelMenuItem >> elementId [
	<return: #BlElementId>
	^ ('{1} - {2}'
		format: {super elementId asSymbol.
				self text}) asBlocElementId
]

{ #category : #accessing }
GtLscLabelMenuItem >> text [
	^ text
]

{ #category : #accessing }
GtLscLabelMenuItem >> text: aText [
	text := aText
]

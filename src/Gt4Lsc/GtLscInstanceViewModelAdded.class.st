Class {
	#name : #GtLscInstanceViewModelAdded,
	#superclass : #GtLscInstanceViewModelAnnouncement,
	#instVars : [
		'lscInstanceViewModel'
	],
	#category : #'Gt4Lsc-Events'
}

{ #category : #'instance creation' }
GtLscInstanceViewModelAdded class >> lscInstanceViewModel: aGtLscInstanceViewModel [
	^ self new lscInstanceViewModel: aGtLscInstanceViewModel
]

{ #category : #accessing }
GtLscInstanceViewModelAdded >> lscInstanceViewModel [
	^ lscInstanceViewModel
]

{ #category : #accessing }
GtLscInstanceViewModelAdded >> lscInstanceViewModel: aGtLscInstanceViewModel [
	lscInstanceViewModel := aGtLscInstanceViewModel
]

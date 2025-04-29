Class {
	#name : #GtLscInstanceViewModelAnnouncement,
	#superclass : #GtLscAnnouncement,
	#instVars : [
		'lscInstanceViewModel'
	],
	#category : #'Gt4Lsc-Events'
}

{ #category : #'instance creation' }
GtLscInstanceViewModelAnnouncement class >> lscInstanceViewModel: aGtLscInstanceViewModel [
	^ self new lscInstanceViewModel: aGtLscInstanceViewModel
]

{ #category : #accessing }
GtLscInstanceViewModelAnnouncement >> lscInstanceViewModel [
	^ lscInstanceViewModel
]

{ #category : #accessing }
GtLscInstanceViewModelAnnouncement >> lscInstanceViewModel: aGtLscInstanceViewModel [
	lscInstanceViewModel := aGtLscInstanceViewModel
]

Class {
	#name : #GtLscInstanceViewModelWithPositionAnnouncement,
	#superclass : #GtLscInstanceViewModelAnnouncement,
	#instVars : [
		'position'
	],
	#category : #'Gt4Lsc-Events'
}

{ #category : #'instance creation' }
GtLscInstanceViewModelWithPositionAnnouncement class >> lscInstanceViewModel: aGtLscInstanceViewModel atPosition: anInteger [
	^ (self lscInstanceViewModel: aGtLscInstanceViewModel)
		position: anInteger;
		yourself
]

{ #category : #accessing }
GtLscInstanceViewModelWithPositionAnnouncement >> position [
	^ position
]

{ #category : #accessing }
GtLscInstanceViewModelWithPositionAnnouncement >> position: anInteger [
	position := anInteger
]

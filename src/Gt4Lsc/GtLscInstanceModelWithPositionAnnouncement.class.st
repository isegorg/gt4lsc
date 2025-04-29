Class {
	#name : #GtLscInstanceModelWithPositionAnnouncement,
	#superclass : #GtLscModelAnnouncement,
	#instVars : [
		'position'
	],
	#category : #'Gt4Lsc-Events'
}

{ #category : #'instance creation' }
GtLscInstanceModelWithPositionAnnouncement class >> lscInstanceModel: aGtLscInstanceModel atPosition: anInteger [
	^ (self lscInstanceModel: aGtLscInstanceModel)
		position: anInteger;
		yourself
]

{ #category : #accessing }
GtLscInstanceModelWithPositionAnnouncement >> position [
	^ position
]

{ #category : #accessing }
GtLscInstanceModelWithPositionAnnouncement >> position: anInteger [
	position := anInteger
]

Class {
	#name : #GtLscModelAnnouncement,
	#superclass : #GtLscAnnouncement,
	#instVars : [
		'lscInstanceModel'
	],
	#category : #'Gt4Lsc-Events'
}

{ #category : #'instance creation' }
GtLscModelAnnouncement class >> lscInstanceModel: aGtLscInstanceModel [
	^ self new lscInstanceModel: aGtLscInstanceModel
]

{ #category : #accessing }
GtLscModelAnnouncement >> lscInstanceModel [
	^ lscInstanceModel
]

{ #category : #accessing }
GtLscModelAnnouncement >> lscInstanceModel: aGtLscInstanceModel [
	lscInstanceModel := aGtLscInstanceModel
]

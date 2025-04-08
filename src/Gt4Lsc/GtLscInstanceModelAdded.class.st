Class {
	#name : #GtLscInstanceModelAdded,
	#superclass : #GtLscModelAnnouncement,
	#instVars : [
		'lscInstanceModel'
	],
	#category : #'Gt4Lsc-Events'
}

{ #category : #'instance creation' }
GtLscInstanceModelAdded class >> lscInstanceModel: aGtLscInstanceModel [
	^ self new lscInstanceModel: aGtLscInstanceModel
]

{ #category : #accessing }
GtLscInstanceModelAdded >> lscInstanceModel [
	^ lscInstanceModel
]

{ #category : #accessing }
GtLscInstanceModelAdded >> lscInstanceModel: aGtLscInstanceModel [
	lscInstanceModel := aGtLscInstanceModel
]

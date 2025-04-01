Class {
	#name : #GtLscModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'title',
		'instances'
	],
	#category : #'Gt4Lsc-! Model'
}

{ #category : #'default model values' }
GtLscModel class >> defaultTitle [
	^ 'Scenario'
]

{ #category : #announcer }
GtLscModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #converting }
GtLscModel >> asElement [
	^ GtLscElement new
		lscViewModel: (GtLscViewModel new lscModel: self);
		yourself
]

{ #category : #'gt - extensions' }
GtLscModel >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live';
		priority: 2;
		stencil: [ self asElement ]
]

{ #category : #initialization }
GtLscModel >> initialize [
	title := self class defaultTitle.
	instances := OrderedCollection empty
]

{ #category : #'events generation' }
GtLscModel >> notifyTitleChanged [
	self announce: GtLscTitleChanged new
]

{ #category : #accessing }
GtLscModel >> title [
	^ title
]

{ #category : #accessing }
GtLscModel >> title: aString [
	self title = aString ifTrue: [ ^ self ].

	title := aString.
	self notifyTitleChanged.
]

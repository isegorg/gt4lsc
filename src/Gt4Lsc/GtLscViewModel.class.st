Class {
	#name : #GtLscViewModel,
	#superclass : #Object,
	#traits : 'TGtWithLscModel + TGtAnnouncer',
	#classTraits : 'TGtWithLscModel classTrait + TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'instanceViewModels'
	],
	#category : #'Gt4Lsc-! View models'
}

{ #category : #announcer }
GtLscViewModel >> announcer [
	<return: #Announcer>

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #initialization }
GtLscViewModel >> createLscInstanceViewModelFor: eachLscInstanceModel [ 
	^ GtLscInstanceViewModel new lscInstanceModel: eachLscInstanceModel
]

{ #category : #initialization }
GtLscViewModel >> initialize [
	super initialize.
	
	instanceViewModels := OrderedCollection empty.
]

{ #category : #accessing }
GtLscViewModel >> instanceViewModels [
	^ instanceViewModels
]

{ #category : #'events generation' }
GtLscViewModel >> notifyLscInstanceViewModelAdded: aGtLscInstanceViewModel [
	self announce: (GtLscInstanceViewModelAdded lscInstanceViewModel: aGtLscInstanceViewModel )
]

{ #category : #'events generation' }
GtLscViewModel >> notifyLscViewModelTitleChanged [
	self announce: (GtLscViewModelTitleChanged new )
]

{ #category : #'events handling' }
GtLscViewModel >> onInstanceAdded: aLscInstanceModelAddedAnnouncement [
	| instanceViewModel |
	instanceViewModel := self createLscInstanceViewModelFor: aLscInstanceModelAddedAnnouncement lscInstanceModel.
	instanceViewModels add: instanceViewModel.
	self notifyLscInstanceViewModelAdded: instanceViewModel
]

{ #category : #'api - lsc model' }
GtLscViewModel >> onLscModelChanged [
	"Is sent when a new lsc model is assigned to the view model"
	
	instanceViewModels := self lscModel instances
			collect: [ :eachLscInstanceModel | self createLscInstanceViewModelFor: eachLscInstanceModel ]
			as: OrderedCollection.
]

{ #category : #'events handling' }
GtLscViewModel >> onTitleChanged: anAnnouncement [
	self notifyLscViewModelTitleChanged
]

{ #category : #'api - lsc model' }
GtLscViewModel >> subscribeToLscModel [
	"Is sent after a new lsc model is assigned to the view model.
	It is required to unsubscribe from the domain model by implementing
	#unsubscribeFromLscModel if view model subscribes to them"
	
	self lscModel weak
		when: GtLscTitleChanged
			send: #onTitleChanged:
			to: self.
	self lscModel weak
		when: GtLscInstanceModelAdded
			send: #onInstanceAdded:
			to: self.
]

{ #category : #'api - lsc' }
GtLscViewModel >> title [
	<return: #String>
	^ self lscModel title
]

{ #category : #'api - lsc' }
GtLscViewModel >> title: aString [
	self lscModel title: aString
]

{ #category : #'api - lsc model' }
GtLscViewModel >> unsubscribeFromLscModel [
	"Is sent before a new lsc model is assigned to the view model.
	View models that subscribe to lsc model are required to implement this methods"
	
	self lscModel unsubscribe: self
]

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

{ #category : #'api - lsc model' }
GtLscViewModel >> addInstanceViewModelFor: aLscInstanceModel [
	"Adds the instance view model corresponding to the instance model in the final position"

	self
		addInstanceViewModelFor: aLscInstanceModel
		atPosition: self instanceViewModelsSize + 1
]

{ #category : #'api - lsc model' }
GtLscViewModel >> addInstanceViewModelFor: aLscInstanceModel atPosition: anInteger [
	| instanceViewModelAdded previousIndex|
	instanceViewModelAdded := self createLscInstanceViewModelFor: aLscInstanceModel.
	previousIndex := anInteger - 1.
	instanceViewModels add: instanceViewModelAdded afterIndex: previousIndex.
	self notifyLscInstanceViewModelAdded: instanceViewModelAdded atPosition: anInteger
]

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
	self initializeInstanceViewModels
]

{ #category : #initialization }
GtLscViewModel >> initializeInstanceViewModels [
	instanceViewModels := OrderedCollection empty
]

{ #category : #'api - lsc model' }
GtLscViewModel >> instanceViewModelFor: aLscInstanceModel ifFound: aFoundBlock ifNone: aNoneBlock [
	instanceViewModels
		detect: [ :eachInstanceViewModel | eachInstanceViewModel isForModel: aLscInstanceModel ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #accessing }
GtLscViewModel >> instanceViewModels [
	^ instanceViewModels
]

{ #category : #accessing }
GtLscViewModel >> instanceViewModelsSize [
	^ instanceViewModels size
]

{ #category : #'api - lsc model' }
GtLscViewModel >> moveInstanceViewModelFor: aLscInstanceModel toPosition: anInteger [
	self
		instanceViewModelFor: aLscInstanceModel
		ifFound: [ :aLscInstanceViewModel | 
			| previousIndex |
			instanceViewModels remove: aLscInstanceViewModel.
			previousIndex := anInteger - 1.
			instanceViewModels add: aLscInstanceViewModel afterIndex: previousIndex.
			self notifyLscInstanceViewModelMoved: aLscInstanceViewModel toPosition: anInteger ]
		ifNone: [  ]
]

{ #category : #'events generation' }
GtLscViewModel >> notifyLscInstanceViewModelAdded: aGtLscInstanceViewModel atPosition: anInteger [
	self
		announce: (GtLscInstanceViewModelAdded
				lscInstanceViewModel: aGtLscInstanceViewModel
				atPosition: anInteger)
]

{ #category : #'events generation' }
GtLscViewModel >> notifyLscInstanceViewModelMoved: aGtLscInstanceViewModel toPosition: anInteger [
	self
		announce: (GtLscInstanceViewModelMoved
				lscInstanceViewModel: aGtLscInstanceViewModel
				atPosition: anInteger)
]

{ #category : #'events generation' }
GtLscViewModel >> notifyLscInstanceViewModelRemoved: aGtLscInstanceViewModel [
	self announce: (GtLscInstanceViewModelRemoved lscInstanceViewModel: aGtLscInstanceViewModel )
]

{ #category : #'events generation' }
GtLscViewModel >> notifyLscViewModelTitleChanged [
	self announce: (GtLscViewModelTitleChanged new )
]

{ #category : #'events handling' }
GtLscViewModel >> onInstanceAdded: aLscInstanceModelAddedAnnouncement [
	self
		addInstanceViewModelFor: aLscInstanceModelAddedAnnouncement lscInstanceModel
		atPosition: aLscInstanceModelAddedAnnouncement position
]

{ #category : #'events handling' }
GtLscViewModel >> onInstanceMoved: aLscInstanceModelMovedAnnouncement [
	self
		moveInstanceViewModelFor: aLscInstanceModelMovedAnnouncement lscInstanceModel
		toPosition: aLscInstanceModelMovedAnnouncement position
]

{ #category : #'events handling' }
GtLscViewModel >> onInstanceRemoved: aLscInstanceModelRemovedAnnouncement [
	self removeInstanceViewModelFor: aLscInstanceModelRemovedAnnouncement lscInstanceModel.
]

{ #category : #'api - lsc model' }
GtLscViewModel >> onLscModelChanged [
	"Is sent when a new lsc model is assigned to the view model"

	self initializeInstanceViewModels.
	self lscModel instances
		do: [ :eachLscInstanceModel |
			self addInstanceViewModelFor: eachLscInstanceModel ]
]

{ #category : #'events handling' }
GtLscViewModel >> onTitleChanged: anAnnouncement [
	self notifyLscViewModelTitleChanged
]

{ #category : #'api - lsc model' }
GtLscViewModel >> removeInstanceViewModelFor: aLscInstanceModel [
	self
		instanceViewModelFor: aLscInstanceModel
		ifFound: [ :aLscInstanceViewModel | instanceViewModels remove: aLscInstanceViewModel.
			self notifyLscInstanceViewModelRemoved: aLscInstanceViewModel ]
		ifNone: [  ]
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
	self lscModel weak
		when: GtLscInstanceModelRemoved
			send: #onInstanceRemoved:
			to: self.
	self lscModel weak
		when: GtLscInstanceModelMoved
			send: #onInstanceMoved:
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

Class {
	#name : #BlElementHotState,
	#superclass : #BlElementUniqueState,
	#category : #'Gt4Lsc-Helpers'
}

{ #category : #accessing }
BlElementHotState >> priority [
	^ UserPriority + 5
]

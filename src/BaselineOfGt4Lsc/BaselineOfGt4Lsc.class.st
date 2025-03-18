Class {
	#name : #BaselineOfGt4Lsc,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4Lsc
}

{ #category : #loading }
BaselineOfGt4Lsc class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt4lsc' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGt4Lsc >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Gt4Lsc'
		]
]

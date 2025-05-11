Extension { #name : #GtLscConstants }

{ #category : #'*Gt4LscContextMenu' }
GtLscConstants class >> contextMenuHandler [
	^ BlElement new
		size: 5 @ 5;
		geometry: BlEllipseGeometry new
]

{ #category : #'*Gt4LscContextMenu' }
GtLscConstants class >> contextMenuPreferredExtent [
	^ 120 @ 100.0
]

{ #category : #'*Gt4LscContextMenu' }
GtLscConstants class >> moveInstanceLeftButtonLabel [
	^ 'Move Left'
]

{ #category : #'*Gt4LscContextMenu' }
GtLscConstants class >> moveInstanceRightButtonLabel [
	^ 'Move Right'
]

{ #category : #'*Gt4LscContextMenu' }
GtLscConstants class >> pickerCellSpacing [
	^ 3
]

{ #category : #'*Gt4LscContextMenu' }
GtLscConstants class >> pickerColumnCount [
	^ 8
]

{ #category : #'*Gt4LscContextMenu' }
GtLscConstants class >> removeInstanceButtonLabel [
	^ 'Remove'
]

"
I find the point that lies on bounds rectangle of a reference element with minimal distance to the center of the given element
"
Class {
	#name : #GtLscClosestPositionBoundsAnchor,
	#superclass : #BlNearestPositionAnchor,
	#category : #'Gt4Lsc-Helpers'
}

{ #category : #accessing }
GtLscClosestPositionBoundsAnchor >> label [
	^ 'Rectangle min distance to center'
]

{ #category : #geometry }
GtLscClosestPositionBoundsAnchor >> positionForAnchoredElement: aGeometryElement within: aCommonParent [
	"Compute and return a global position (in space) of this anchor"
	"Return the bounds point with minimal distance to nearestToElement center"
	<return: #Point>
| nearestCenter theBoundsInParent aClampedPoint |
	nearestCenter := (self nearestToElement bounds inParent: aCommonParent) center.
	theBoundsInParent := self referenceElement bounds inParent: aCommonParent.
	aClampedPoint := (nearestCenter min: theBoundsInParent bottomRight) max: theBoundsInParent topLeft.
	^ aClampedPoint
]

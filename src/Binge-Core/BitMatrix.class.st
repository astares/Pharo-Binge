"
A bit matrix is a matrix with bit field of equal size as rows
"
Class {
	#name : #BitMatrix,
	#superclass : #Object,
	#instVars : [
		'rows'
	],
	#category : #'Binge-Core-Base'
}

{ #category : #'instance creation' }
BitMatrix class >> fromBitFields: aCollectionOfBitFields [

	aCollectionOfBitFields ifEmpty: [ ^ nil ].
	(aCollectionOfBitFields allSatisfy: [:row | row numberOfBits == aCollectionOfBitFields first numberOfBits ])
			ifFalse: [ self error: 'All rows must be of same size' ].
	
	^ (self new)
			rows: aCollectionOfBitFields;
			yourself
]

{ #category : #'instance creation' }
BitMatrix class >> ofSize: aPoint [

	|rows|
	rows := OrderedCollection new.
	aPoint y timesRepeat: [ rows add: aPoint x disabledBits ].
	^ self fromBitFields: rows
]

{ #category : #accessing }
BitMatrix >> at: aRowIndex [

	^ self rows at: aRowIndex
]

{ #category : #printing }
BitMatrix >> printOn: aStream [

	self rows
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream cr ]
]

{ #category : #accessing }
BitMatrix >> rows [

	^ rows
]

{ #category : #accessing }
BitMatrix >> rows: anObject [

	rows := anObject
]

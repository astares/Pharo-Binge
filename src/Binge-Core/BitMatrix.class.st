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

	aCollectionOfBitFields ifEmpty: [ self error: 'Empty matrix is not useful' ].
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

{ #category : #accessing }
BitMatrix >> bitAt: aPoint [

	^(self rows at: aPoint y) bitAt: aPoint x
]

{ #category : #operating }
BitMatrix >> disableBitAt: aPoint [

	(self rows at: aPoint y) disableBitAt: aPoint x
]

{ #category : #operating }
BitMatrix >> enableBitAt: aPoint [

	(self rows at: aPoint y) enableBitAt: aPoint x
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

{ #category : #operating }
BitMatrix >> toggleAllBits [

	self rows do: [:each | each toggleAllBits ]
]

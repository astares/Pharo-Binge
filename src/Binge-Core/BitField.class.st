"
A bit field is a field of bits that can be set and unset.
"
Class {
	#name : #BitField,
	#superclass : #Object,
	#instVars : [
		'bitsValue',
		'numberOfBits'
	],
	#category : #'Binge-Core-Base'
}

{ #category : #'instance creation' }
BitField class >> fromInteger: anInteger [

	^ (self length: (anInteger printStringRadix: 2) size - 2)
			bitsValue: anInteger;
			yourself
]

{ #category : #'instance creation' }
BitField class >> length: bitLength [

	^ (self new)
			numberOfBits: bitLength;
			yourself
]

{ #category : #utilities }
BitField class >> numberOfBytesRequiredForBits: numberOfBits [
	"Return the number of bits required to store the given number of bits"

	| numberOfBytes |
	numberOfBytes := (numberOfBits / 8) roundUpTo: 1.
	^ numberOfBytes
]

{ #category : #comparing }
BitField >> = anotherBitfield [

	^ self species = anotherBitfield species
			and: [ self bitsValue = anotherBitfield bitsValue
			and: [ self numberOfBits = anotherBitfield numberOfBits ]]
]

{ #category : #converting }
BitField >> asNumber [

	^ self bitsValue
]

{ #category : #'private - accessing' }
BitField >> bitsValue [

	^ bitsValue
]

{ #category : #'private - accessing' }
BitField >> bitsValue: aValue [

	bitsValue := aValue
]

{ #category : #comparing }
BitField >> hash [

	^ bitsValue hash bitXor: numberOfBits hash
]

{ #category : #initialization }
BitField >> initialize [

	super initialize.
	bitsValue := 0
]

{ #category : #operating }
BitField >> invert [

	1 to: numberOfBits do: [ :index | self toggleBit: index ]
]

{ #category : #testing }
BitField >> isBitField [

	^ true
]

{ #category : #accessing }
BitField >> numberOfBits [

	^ numberOfBits
]

{ #category : #'private - accessing' }
BitField >> numberOfBits: anInteger [

	numberOfBits := anInteger
]

{ #category : #accessing }
BitField >> numberOfBytesRequired [

	^ self class numberOfBytesRequiredForBits: self numberOfBits
]

{ #category : #printing }
BitField >> printOn: aStream [

	aStream nextPutAll: (bitsValue printPaddedWith: $0 to: numberOfBits base: 2)
]

{ #category : #'bit manipulation' }
BitField >> setBit: index [

	(index between: 1 and: numberOfBits) ifFalse: [
		^ self error: 'Invalid bit index' ].
	bitsValue := bitsValue bitOr: 1 << (index - 1)
]

{ #category : #'bit manipulation' }
BitField >> toggleBit: index [

	(index between: 1 and: numberOfBits) ifFalse: [
		^ self error: 'Invalid bit index' ].
	bitsValue := bitsValue bitXor: 1 << (index - 1)
]

{ #category : #'bit manipulation' }
BitField >> toggleBits: aCollectionOfIndices [

	aCollectionOfIndices do: [ :each | self toggleBit: each ].
	^ self
]

{ #category : #evaluating }
BitField >> value [

	^ self bitsValue
]

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

{ #category : #comparing }
BitField >> = anotherBitfield [

	^ self species = anotherBitfield species
			and: [ self bitsValue = anotherBitfield bitsValue
			and: [ self numberOfBits = anotherBitfield numberOfBits ]]
]

{ #category : #converting }
BitField >> asNumber [

	^ bitsValue
]

{ #category : #accessing }
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

{ #category : #printing }
BitField >> printOn: aStream [

	aStream nextPutAll: (bitsValue printPaddedWith: $0 to: numberOfBits base: 2)
]

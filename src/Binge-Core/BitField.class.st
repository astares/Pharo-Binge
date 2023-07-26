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

	^ self
		  value: anInteger
		  length: (anInteger printStringRadix: 2) size - 2
]

{ #category : #'instance creation' }
BitField class >> fromString: aString [

	| instance end |
	end := aString size.
	instance := self length: aString size.
	aString withIndexDo: [ :each :index |
		each = $1
			ifTrue: [ instance toggleBitAt: end + 1 - index ]
			ifFalse: [
			each = $0 ifFalse: [ self error: 'String is not in bit format' ] ] ].

	^ instance
]

{ #category : #'instance creation' }
BitField class >> length: bitLength [

	^ (self new)
			numberOfBits: bitLength;
			yourself
]

{ #category : #utilities }
BitField class >> numberOfBitsToRepresent: anInteger [
	"Return the number of bits required to represent the given integer"

	anInteger <= 0 ifTrue: [ ^ 0 ].
	^ (anInteger printStringRadix: 2) size - 2
]

{ #category : #utilities }
BitField class >> numberOfBytesRequiredForBits: numberOfBits [
	"Return the number of bits required to store the given number of bits"

	| numberOfBytes |
	numberOfBytes := (numberOfBits / 8) roundUpTo: 1.
	^ numberOfBytes
]

{ #category : #'instance creation' }
BitField class >> value: initialValue length: initialBitLength [

	initialBitLength < (self numberOfBitsToRepresent: initialValue)
		ifTrue: [ self error: 'More bits required to represent this value' ].

	^ (self length: initialBitLength)
			initialBitsValue: initialValue;
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

	^ self bitsValue
]

{ #category : #'bit access' }
BitField >> bitAt: index [

	(index between: 1 and: numberOfBits) ifFalse: [
		^ self error: 'Invalid bit index' ].
	^ (bitsValue bitShift: 1 - index) bitAnd: 1
]

{ #category : #accessing }
BitField >> bits [
	|coll|
	coll := OrderedCollection new.
	1 to: numberOfBits do: [:each |
		coll add: (Bit value: (self bitAt: each) atPosition: each	)
	].
	^ coll
]

{ #category : #'private - accessing' }
BitField >> bitsValue [

	^ bitsValue
]

{ #category : #'private - accessing' }
BitField >> bitsValue: aValue [

	bitsValue := aValue
]

{ #category : #'bit manipulation' }
BitField >> disableBitAt: index [

	(index between: 1 and: numberOfBits) ifFalse: [^ self error: 'Invalid bit index'].
   (self bitAt: index) = 0 ifFalse: [ self toggleBitAt: index ]
]

{ #category : #'bit manipulation' }
BitField >> disableBitsAt: aCollectionOfIndices [

	aCollectionOfIndices do: [ :each | self disableBitAt: each ].
	^ self
]

{ #category : #'bit manipulation' }
BitField >> enableBitAt: index [

	(index between: 1 and: numberOfBits) ifFalse: [
		^ self error: 'Invalid bit index' ].
	bitsValue := bitsValue bitOr: 1 << (index - 1)
]

{ #category : #'bit manipulation' }
BitField >> enableBitsAt: aCollectionOfIndices [

	aCollectionOfIndices do: [ :each | self enableBitAt: each ].
	^ self
]

{ #category : #comparing }
BitField >> hash [

	^ bitsValue hash bitXor: numberOfBits hash
]

{ #category : #'private - initalization' }
BitField >> initialBitsValue: initialValue [

	bitsValue := initialValue
]

{ #category : #initialization }
BitField >> initialize [

	super initialize.
	self initialBitsValue: 0
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
	"Return the number of bytes required to represent the receiver"

	^ self class numberOfBytesRequiredForBits: self numberOfBits
]

{ #category : #printing }
BitField >> printOn: aStream [

	aStream nextPutAll: (bitsValue printPaddedWith: $0 to: numberOfBits base: 2)
]

{ #category : #converting }
BitField >> readStream [

	^ (self printString inject: OrderedCollection new into: [:coll :each | coll add: each asString asNumber. coll ]) readStream
]

{ #category : #operating }
BitField >> toggleAllBits [

	1 to: numberOfBits do: [ :index | self toggleBitAt: index ]
]

{ #category : #'bit manipulation' }
BitField >> toggleBitAt: index [

	(index between: 1 and: numberOfBits) ifFalse: [
		^ self error: 'Invalid bit index' ].
	bitsValue := bitsValue bitXor: 1 << (index - 1)
]

{ #category : #'bit manipulation' }
BitField >> toggleBitsAt: aCollectionOfIndices [

	aCollectionOfIndices do: [ :each | self toggleBitAt: each ].
	^ self
]

{ #category : #evaluating }
BitField >> value [

	^ self bitsValue
]

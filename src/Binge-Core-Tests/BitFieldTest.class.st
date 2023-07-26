"
A BitFieldTest is a test class for testing the behavior of BitField
"
Class {
	#name : #BitFieldTest,
	#superclass : #TestCase,
	#category : #'Binge-Core-Tests-Base'
}

{ #category : #'tests - conversion' }
BitFieldTest >> testAsBitField [

	self assert: 8 asBitField printString equals: '1000'.
	self assert: 9 asBitField printString equals: '1001'
]

{ #category : #'tests - conversion' }
BitFieldTest >> testAsNumber [

	self assert: 42 asBitField asNumber equals: 42
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testClearBit [

	 self assert: (2r1111 asBitField clearBitAt: 2) printString equals: '1101'
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testClearBits [

	 self assert: (2r11111 asBitField clearBitsAt: #(1 3)) printString equals: '11010'
]

{ #category : #'tests - comparision' }
BitFieldTest >> testEqual [

	self deny: 16 asBitField equals: 15 asBitField.

	self assert: 16 asBitField equals: 16 asBitField
]

{ #category : #'tests - comparision' }
BitFieldTest >> testHashing [

	self assert: 15 asBitField hash equals: 15 asBitField hash
]

{ #category : #'tests - printing' }
BitFieldTest >> testInitialPrintString [

	self assert: 32 disabledBits printString size equals: 32.
	self assert: 32 disabledBits printString equals: '00000000000000000000000000000000'.

	self assert: 2 disabledBits printString equals: '00'
]

{ #category : #'tests - instance creation' }
BitFieldTest >> testInstanceCreationFailingDueToNotEnoughBits [

	self should: [ BitField value: 4 length: 1 ] raise: Error
]

{ #category : #'tests - instance creation' }
BitFieldTest >> testInstanceCreationFromInteger [

	"We want a bit field with 32 as the initial bit pattern - '100000'"
	self assert: 32 asBitField isBitField.

	"We want a mapped bit field of a specific size - '00000000000000000000000000000000'"
	self assert: 32 disabledBits isBitField.

	"We want a mapped bit field of a specific size - '11111111111111111111111111111111'"
	self assert: 32 enabledBits isBitField
]

{ #category : #'tests - instance creation' }
BitFieldTest >> testInstanceCreationFromNegativeIntegerShouldFail [

	self should: [ -2 bits ] raise: Error
]

{ #category : #'tests - instance creation' }
BitFieldTest >> testInstanceCreationFromString [

	| bitField |
	bitField := (BitField fromString: '11001').

	self assert: (bitField isKindOf: BitField).
	self assert: bitField printString equals: '11001'
]

{ #category : #'tests - extensions' }
BitFieldTest >> testNextPowerOfTwo [

	self
		assert: 0 nextPowerOfTwo equals: 1;
		assert: 1 nextPowerOfTwo equals: 1;
		assert: 2 nextPowerOfTwo equals: 2;
		assert: 3 nextPowerOfTwo equals: 4;
		assert: 4 nextPowerOfTwo equals: 4;
		assert: 5 nextPowerOfTwo equals: 8;
		assert: 6 nextPowerOfTwo equals: 8;
		assert: 7 nextPowerOfTwo equals: 8;
		assert: 8 nextPowerOfTwo equals: 8;
		assert: 16 nextPowerOfTwo equals: 16;
		assert: 17 nextPowerOfTwo equals: 32;
		assert: 32 nextPowerOfTwo equals: 32;
		assert: 33 nextPowerOfTwo equals: 64
]

{ #category : #'tests - accessing' }
BitFieldTest >> testNumberOfBits [

	self
		assert: 4 disabledBits numberOfBits equals: 4;
		assert: 42 disabledBits numberOfBits equals: 42
]

{ #category : #'tests - accessing' }
BitFieldTest >> testNumberOfBytesRequired [

	self
		assert: 4 disabledBits numberOfBytesRequired equals: 1;
		assert: 8 disabledBits numberOfBytesRequired equals: 1;
		assert: 9 disabledBits numberOfBytesRequired equals: 2;
		assert: 32 disabledBits numberOfBytesRequired equals: 4
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testSetBit [

	 self assert: (4 disabledBits setBitAt: 2) printString equals: '0010'
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testSetBits [

	self assert: (5 disabledBits setBitsAt: #( 1 3 )) printString equals: '00101'
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testToggleBit [

	self assert: (2r1111 asBitField toggleBitAt: 2) printString equals: '1101'
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testToggleBits [

	self assert: (2r11111111 asBitField toggleBitsAt: #(1 2 7)) printString equals: '10111100'
]

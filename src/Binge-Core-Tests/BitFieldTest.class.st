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

	 self assert: (4 bits invert clearBit: 2) printString equals: '1101'
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testClearBits [

	 self assert: (5 bits invert clearBits: #(1 3)) printString equals: '11010'
]

{ #category : #'tests - comparision' }
BitFieldTest >> testEqual [

	self deny: 32 bits equals: 32.

	self assert: 32 bits equals: 32 bits.

	self deny: 32 bits equals: 64 bits
]

{ #category : #'tests - comparision' }
BitFieldTest >> testHashing [

	self assert: 32 bits hash equals: 32 bits hash
]

{ #category : #'tests - printing' }
BitFieldTest >> testInitialPrintString [

	self assert: 32 bits printString size equals: 32.
	self assert: 32 bits printString equals: '00000000000000000000000000000000'.

	self assert: 2 bits printString equals: '00'
]

{ #category : #'tests - instance creation' }
BitFieldTest >> testInstanceCreationFromInteger [

	self assert: 32 bits isBitField
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
		assert: 0 bits numberOfBits equals: 0;
		assert: 4 bits numberOfBits equals: 4;
		assert: 42 bits numberOfBits equals: 42
]

{ #category : #'tests - accessing' }
BitFieldTest >> testNumberOfBytesRequired [

	self
		assert: 0 bits numberOfBytesRequired equals: 0;
		assert: 4 bits numberOfBytesRequired equals: 1;
		assert: 8 bits numberOfBytesRequired equals: 1;
		assert: 9 bits numberOfBytesRequired equals: 2;
		assert: 32 bits numberOfBytesRequired equals: 4
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testSetBit [

	 self assert: (4 bits setBit: 2) printString equals: '0010'
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testSetBits [

	self assert: (5 bits setBits: #( 1 3 )) printString equals: '00101'
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testToggleBit [

	self assert: (4 bits toggleBit: 2) printString equals: '0010'
]

{ #category : #'tests - bit manipulation' }
BitFieldTest >> testToggleBits [

	self assert: (8 bits toggleBits: #(1 2 7)) printString equals: '01000011'
]

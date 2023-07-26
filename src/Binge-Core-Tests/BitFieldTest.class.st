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

{ #category : #tests }
BitFieldTest >> testInstanceCreationFromInteger [

	self assert: 32 bits isBitField
]

{ #category : #tests }
BitFieldTest >> testInstanceCreationFromNegativeIntegerShouldFail [

	self should: [ -2 bits ] raise: Error
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
BitFieldTest >> testToggleBit [

	self assert: (4 bits toggleBit: 2) printString equals: '0010'.

	self assert: (8 bits toggleBits: #(1 2 7)) printString equals: '01000011'
]

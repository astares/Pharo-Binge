"
A BitFieldTest is a test class for testing the behavior of BitField
"
Class {
	#name : #BitFieldTest,
	#superclass : #TestCase,
	#category : #'Binge-Core-Tests-Base'
}

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

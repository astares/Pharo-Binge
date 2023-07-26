"
A BitTest is a test class for testing the behavior of Bit
"
Class {
	#name : #BitTest,
	#superclass : #TestCase,
	#category : #'Binge-Core-Tests-Base'
}

{ #category : #tests }
BitTest >> testInstanceCreation [

	self assert: (1 bit isKindOf: Bit).

	self assert: 1 bit value equals: 0.
	self assert: 1 bit position equals: 0
]

{ #category : #tests }
BitTest >> testInstanceCreationFromInteger [

	self
		assert: 1 asBit position equals: 1;
		assert: 2 asBit position equals: 2;
		assert: 4 asBit position equals: 3;
		assert: 8 asBit position equals: 4;
		assert: 16 asBit position equals: 5;
		assert: 32 asBit position equals: 6;
		assert: 64 asBit position equals: 7;
		assert: 128 asBit position equals: 8
]

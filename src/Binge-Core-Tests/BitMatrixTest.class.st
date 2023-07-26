"
A BitMatrixTest is a test class for testing the behavior of BitMatrix
"
Class {
	#name : #BitMatrixTest,
	#superclass : #TestCase,
	#category : #'Binge-Core-Tests-Base'
}

{ #category : #'tests - operating' }
BitMatrixTest >> testEnableBitAt [

	self assert: ((BitMatrix ofSize: 3@4) enableBitAt: 2@1) printString equals: '010
000
000
000'
]

{ #category : #'tests - printing' }
BitMatrixTest >> testPrinting [

	self assert: (BitMatrix ofSize: 1@1) printString equals: '0'.
	self assert: (BitMatrix ofSize: 2@1) printString equals: '00'.

	self assert: (BitMatrix ofSize: 4@3) printString equals: '0000
0000
0000'
]

{ #category : #'tests - bit manipulation' }
BitMatrixTest >> testToggleAllBits [

	| matrix |
	matrix := (BitMatrix ofSize: 3 @ 4) enableBitAt: 2 @ 1.
	self assert: matrix toggleAllBits printString equals: '101
111
111
111'
]

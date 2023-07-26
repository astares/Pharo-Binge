"
A BitMatrixTest is a test class for testing the behavior of BitMatrix
"
Class {
	#name : #BitMatrixTest,
	#superclass : #TestCase,
	#category : #'Binge-Core-Tests-Base'
}

{ #category : #'tests - printing' }
BitMatrixTest >> testPrinting [

	self assert: (BitMatrix ofSize: 1@1) printString equals: '0'.
	self assert: (BitMatrix ofSize: 2@1) printString equals: '00'.

	self assert: (BitMatrix ofSize: 4@3) printString equals: '0000
0000
0000'
]

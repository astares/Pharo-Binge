"
An APBinaryStreamReaderTest is a test class for testing the behavior of APBinaryStreamReader
"
Class {
	#name : #BinaryStreamReaderTest,
	#superclass : #TestCase,
	#category : #'Binge-Core-Tests-Reading'
}

{ #category : #utilities }
BinaryStreamReaderTest >> readerFor: aStream [

	^ BinaryStreamReader on: aStream
]

{ #category : #'tests - big endian' }
BinaryStreamReaderTest >> testBigEndianReadingWith1Byte [

	| instance |
	instance := self readerFor: #(16r2A) readStream.
	self assert: (instance readBigEndianInteger: 1) equals: 16r2A
]

{ #category : #'tests - big endian' }
BinaryStreamReaderTest >> testBigEndianReadingWith2Bytes [

	| instance |
	instance := self readerFor: #(16r4F 16r52) readStream.
	self assert: (instance readBigEndianInteger: 2) equals: 16r4F52
]

{ #category : #'tests - big endian' }
BinaryStreamReaderTest >> testBigEndianReadingWith3Bytes [

	| instance |
	instance := self readerFor: #(16r4F 16r52 16rDC) readStream.
	self assert: (instance readBigEndianInteger: 3) equals: 16r4F52DC
]

{ #category : #'tests - big endian' }
BinaryStreamReaderTest >> testBigEndianReadingWith4Bytes [

	| instance |
	instance := self readerFor: #(16r4F 16r52 16rDC 16rEF) readStream.
	self assert: (instance readBigEndianInteger: 4) equals: 16r4F52DCEF
]

{ #category : #'tests - big endian' }
BinaryStreamReaderTest >> testBigEndianReadingWith5Bytes [

	| instance |
	instance := self readerFor: #(16r4F 16r52 16rDC 16rEF 16r15) readStream.
	self assert: (instance readBigEndianInteger: 5) equals: 16r4F52DCEF15
]

{ #category : #'tests - instance creation' }
BinaryStreamReaderTest >> testInstanceCreationFromStream [

	|stream|
	stream := String new readStream.
	self assert: (BinaryStreamReader on: stream) stream identicalTo: stream
]

{ #category : #'tests - little endian' }
BinaryStreamReaderTest >> testLittleEndianReadingWith1Byte [

	| instance |
	instance := self readerFor: #(16r2A) readStream.
	self assert: (instance readLittleEndianInteger: 1) equals: 16r2A
]

{ #category : #'tests - little endian' }
BinaryStreamReaderTest >> testLittleEndianReadingWith2Bytes [

	| instance |
	instance := self readerFor: #(16r52 16r4F) readStream.
	self assert: (instance readLittleEndianInteger: 2) equals: 16r4F52
]

{ #category : #'tests - little endian' }
BinaryStreamReaderTest >> testLittleEndianReadingWith3Bytes [

	| instance |
	instance := self readerFor: #(16rDC 16r52 16r4F) readStream.
	self assert: (instance readLittleEndianInteger: 3) equals: 16r4F52DC
]

{ #category : #'tests - little endian' }
BinaryStreamReaderTest >> testLittleEndianReadingWith4Bytes [

	| instance |
	instance := self readerFor: #(16rEF 16rDC 16r52 16r4F) readStream.
	self assert: (instance readLittleEndianInteger: 4) equals: 16r4F52DCEF
]

{ #category : #'tests - little endian' }
BinaryStreamReaderTest >> testLittleEndianReadingWith5Bytes [

	| instance |
	instance := self readerFor: #(16r15 16rEF 16rDC 16r52 16r4F) readStream.
	self assert: (instance readLittleEndianInteger: 5) equals: 16r4F52DCEF15
]

{ #category : #'tests - big endian' }
BinaryStreamReaderTest >> testReadBigEndianInteger [

	| instance |
	instance := self readerFor: #(16r52 16r4F) readStream.
	self assert: (instance readBigEndianInteger: 2) equals: 16r524F
]

{ #category : #'tests - little endian' }
BinaryStreamReaderTest >> testReadLittleEndianInteger [

	| instance |
	instance := self readerFor: #(16r4F 16r52) readStream.
	self assert: (instance readLittleEndianInteger: 2) equals: 16r524F
]

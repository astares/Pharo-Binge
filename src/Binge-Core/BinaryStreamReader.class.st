"
A reader from a binary stream
"
Class {
	#name : #BinaryStreamReader,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'Binge-Core-Reading'
}

{ #category : #'instance creation' }
BinaryStreamReader class >> on: aStream [

	^ (self new)
			stream: aStream;
			yourself
]

{ #category : #initialization }
BinaryStreamReader >> close [
	"Closes the stream"

	stream close
]

{ #category : #'reading - little endian' }
BinaryStreamReader >> readBigEndianInteger: numberOfBytes [
    | byteArray n |
    byteArray := stream next: numberOfBytes.
    n := 0.
    1 to: numberOfBytes do: [:i |
        n := (n bitShift: 8) + (byteArray at: i)].
    (byteArray at: 1) >= 128
        ifTrue: [ n := -16r100000000 + n ].
    ^ n
]

{ #category : #reading }
BinaryStreamReader >> readByte [
	"Read and return the next byte from the stream."

	^ stream next
]

{ #category : #'reading - little endian' }
BinaryStreamReader >> readLittleEndianInteger: numberOfBytes [
    | byteArray n |
    byteArray := stream next: numberOfBytes.
    n := 0.
    numberOfBytes to: 1 by: -1 do: [:i |
        n := (n bitShift: 8) + (byteArray at: i)].
    (byteArray at: numberOfBytes) >= 128
        ifTrue: [ n := -16r100000000 + n ].
    ^ n
]

{ #category : #'private - accessing' }
BinaryStreamReader >> stream [
	"Returns the receives stream."

	^ stream
]

{ #category : #'private - accessing' }
BinaryStreamReader >> stream: aStream [
	"Sets the receivers stream."

	stream := aStream
]

Extension { #name : #Integer }

{ #category : #'*Binge-Core' }
Integer >> asBit [

	self isPowerOfTwo ifFalse: [ self error: 'Only possible for integers representing a bit position' ].

	^ (Bit new )
		position: (self log: 2) asInteger + 1;
		yourself
]

{ #category : #'*Binge-Core' }
Integer >> asBitField [

	^ BitField fromInteger: self
]

{ #category : #'*Binge-Core' }
Integer >> bit [

	self == 1 ifFalse: [ self error: 'Use #bits if you need more than one bit' ].
	^ Bit new
]

{ #category : #'*Binge-Core' }
Integer >> bits [

	self < 0 ifTrue: [ self error: 'Please only create positive number of bits' ].
	^ BitField length: self
]

{ #category : #'*Binge-Core' }
Integer >> nextPowerOfTwo [
	"Returns the next power of two equal or following the receiver"

	| powerOfTwo |
	powerOfTwo := 1.

	[ powerOfTwo < self ] whileTrue: [
		powerOfTwo := powerOfTwo bitShift: 1 ].

	^ powerOfTwo
]

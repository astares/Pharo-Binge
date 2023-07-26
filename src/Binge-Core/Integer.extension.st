Extension { #name : #Integer }

{ #category : #'*Binge-Core' }
Integer >> asBitField [

	^ BitField fromInteger: self
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

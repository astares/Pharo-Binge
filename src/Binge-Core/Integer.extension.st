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

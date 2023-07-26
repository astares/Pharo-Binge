"
Representation of a single bit. It might have a position.
"
Class {
	#name : #Bit,
	#superclass : #Object,
	#instVars : [
		'value',
		'position'
	],
	#category : #'Binge-Core-Base'
}

{ #category : #'private - checking' }
Bit class >> checkValue: aValue [

	(#(0 1) includes: aValue)
			ifFalse: [ self error: 'Bits can only have a value of zero or one' ]
]

{ #category : #'instance creation' }
Bit class >> value: aValue [

	^ (self new)
			value: aValue;
			yourself
]

{ #category : #'instance creation' }
Bit class >> value: aValue atPosition: aPosition [

	^ (self new)
			position: aPosition;
			value: aValue;
			yourself
]

{ #category : #initialization }
Bit >> initialize [

	super initialize.
	value := 0.
	position := 0
]

{ #category : #testing }
Bit >> isNotSet [

	^ self isSet not
]

{ #category : #testing }
Bit >> isSet [

	^ value = 1
]

{ #category : #accessing }
Bit >> position [

	^ position
]

{ #category : #accessing }
Bit >> position: anObject [

	position := anObject
]

{ #category : #operating }
Bit >> set [
	"Sets the bit"

	value := 1
]

{ #category : #operating }
Bit >> toggle [

	value := value = 0
		         ifTrue: [ 1 ]
		         ifFalse: [ 0 ]
]

{ #category : #operating }
Bit >> unset [
	"Unset the bit"

	value := 0
]

{ #category : #evaluating }
Bit >> value [

	^ value
]

{ #category : #accessing }
Bit >> value: aValue [

	self class checkValue: aValue.
	value := aValue
]

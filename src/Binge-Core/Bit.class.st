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
Bit class >> disabled [

	^ self value: 0
]

{ #category : #'instance creation' }
Bit class >> enabled [

	^ self value: 1
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

{ #category : #operating }
Bit >> disable [
	"Disable the bit by setting to 0"

	value := 0
]

{ #category : #operating }
Bit >> enable [
	"Enable the bit by setting to 1"

	value := 1
]

{ #category : #initialization }
Bit >> initialize [

	super initialize.
	value := 0.
	position := 0
]

{ #category : #testing }
Bit >> isDisabled [
	"Return true if the bit is disabled, false otherwise."

	^ self isEnabled not
]

{ #category : #testing }
Bit >> isEnabled [
	"Return true if the bit is enabled, false otherwise."

	^ value = 1
]

{ #category : #testing }
Bit >> isNotDisabled [
	"Return true if the bit is not disabled, false otherwise."

	^ self isDisabled not
]

{ #category : #testing }
Bit >> isNotEnabled [
	"Return true if the bit is not enabled, false otherwise."

	^ self isEnabled not
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
Bit >> toggle [

	value := value = 0
		         ifTrue: [ 1 ]
		         ifFalse: [ 0 ]
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

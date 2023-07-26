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

{ #category : #initialization }
Bit >> initialize [

	super initialize.
	value := 0.
	position := 0
]

{ #category : #accessing }
Bit >> position [

	^ position
]

{ #category : #accessing }
Bit >> position: anObject [

	position := anObject
]

{ #category : #evaluating }
Bit >> value [

	^ value
]

{ #category : #accessing }
Bit >> value: anObject [

	value := anObject
]

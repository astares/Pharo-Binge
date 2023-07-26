"
A BitTest is a test class for testing the behavior of Bit
"
Class {
	#name : #BitTest,
	#superclass : #TestCase,
	#category : #'Binge-Core-Tests-Base'
}

{ #category : #'tests - operating' }
BitTest >> testDisable [

	self assert: Bit enabled disable isDisabled.
	self assert: Bit enabled disable isNotEnabled
]

{ #category : #'tests - operating' }
BitTest >> testEnable [

	self assert: Bit disabled enable isEnabled.
	self assert: Bit disabled enable isNotDisabled
]

{ #category : #tests }
BitTest >> testInstanceCreation [

	self assert: (1 bit isKindOf: Bit).

	self assert: 1 bit value equals: 0.
	self assert: 1 bit position equals: 0
]

{ #category : #tests }
BitTest >> testInstanceCreationFromInteger [

	self
		assert: 1 asBit position equals: 1;
		assert: 2 asBit position equals: 2;
		assert: 4 asBit position equals: 3;
		assert: 8 asBit position equals: 4;
		assert: 16 asBit position equals: 5;
		assert: 32 asBit position equals: 6;
		assert: 64 asBit position equals: 7;
		assert: 128 asBit position equals: 8
]

{ #category : #'tests - instance creation' }
BitTest >> testInstanceCreationWithInvalidValues [

	self should: [ Bit value: 3 ] raise: Error
]

{ #category : #'tests - testing' }
BitTest >> testIsDisabled [

	self assert: Bit disabled isDisabled.
	self deny: Bit disabled isEnabled
]

{ #category : #'tests - testing' }
BitTest >> testIsEnabled [

	self assert: Bit enabled isEnabled.
	self deny: Bit enabled isDisabled
]

{ #category : #'tests - testing' }
BitTest >> testIsNotDisabled [

	self assert: Bit enabled isNotDisabled.
	self deny: Bit enabled isNotEnabled
]

{ #category : #'tests - testing' }
BitTest >> testIsNotEnabled [

	self assert: Bit disabled isNotEnabled.
	self deny: Bit disabled isNotDisabled
]

{ #category : #'tests - accessing' }
BitTest >> testPosition [

	self assert: Bit enabled position equals: 0.
	self assert: Bit disabled position equals: 0
]

{ #category : #'tests - accessing' }
BitTest >> testSetInvalidValue [

	self should: [ 1 bit value: 3 ] raise: Error
]

{ #category : #'tests - operating' }
BitTest >> testToggle [

	self assert: Bit disabled toggle isEnabled.
	self assert: Bit enabled toggle isDisabled
]

{ #category : #'tests - accessing' }
BitTest >> testValue [

	self assert: Bit enabled value equals: 1.
	self assert: Bit disabled value equals: 0
]

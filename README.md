# Binge for Pharo

## About

BINGE - BIT MANIPULATION NEXT GENERATION for [Pharo](https://www.pharo.org)

Binge is a library for Pharo to take back control on bits and bytes. A binge typically refers to an excessive and uncontrolled indulgence in something. 

[![Unit Tests](https://github.com/astares/Pharo-Binge/workflows/Build/badge.svg?branch=main)](https://github.com/astares/Pharo-Binge/actions?query=workflow%3ABuild)
[![Coverage Status](https://codecov.io/github/astares/Pharo-Binge/coverage.svg?branch=main)](https://app.codecov.io/gh/astares/Pharo-Binge/branch/main)

[![Pharo 9](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)

## Loading

```Smalltalk
Metacello new 
	repository: 'github://astares/Pharo-Binge:main/src';
	baseline: 'Binge';
	load
```

## Overview

### BitFields
#### Creating bit fields
A bit field (represented by instances of class **BitField**) is a sequence of bits. If you now how many bits you need it is easy to create either with disabled or enabled bits

```Smalltalk
4 disabledBits. "Returns a bit field of size 4 initialized with 0000"
4 enabledBits   "Returns a bit field of size 4 initialized with 1111"
```

If you know the integer values a bit field should represent you can also use the *#asBitField* method to create one:
```Smalltalk
36 asBitField  "Returns a bit field 100100 where the bit 32 and bit 4 is enabled"
```
Be aware that the index starts on the right side.

#### Bit manipulation
Once you have a bit field you can start to manipulate it. As Smalltalk allows to directly write numbers with a base of 2 using the "r"-Notation this comes in here very handy:

```Smalltalk
2r1111 asBitField toggleBitAt: 2  "Toogles the bit on the 2nd position from right, so the bit field 1111 becomes 1101"
```
If you like you can toggle all bits in one pass:
```Smalltalk
269 asBitField toggleAllBits.
```

You can also explicitly manipulate a bit at a specific position by enabling or disabling it:
```Smalltalk
128 asBitField enableBitAt: 4   "Switches the bit on the 4th position from right, so the bit field 10000000 becomes 10001000"

128 asBitField disableBitAt: 8   "Switches the bit on the 4th position from right, so the bit field 10000000 becomes 00000000"
```

You can also manipulate several bit positions at the same time:
```Smalltalk
8 disabledBits enableBitsAt: #(1 3) "Returns 00000101 where the bits on the first and 3rd position are enabled"
```
#### Querying bits
If you want to know the value at a specific position use *#getBitAt:* method:
```Smalltalk
2r1000 asBitField bitAt: 4   "Returns the bit value at the 4th position from right, which is 1"
```

### BitMatrix
#### Creating bit matrix
A bit matrix is basically a matrix with bits at each position. Internally all the rows are bit fields. 
```Smalltalk
BitMatrix ofSize: 4@3
```
creates a simple matrix 
```
0000
0000
0000
```
#### Bit manipulation
Similar to bit fields you can also manipulate the bits within a bit matrix. Use a point to address the right position:
```Smalltalk
(BitMatrix ofSize: 3@4) enableBitAt: 2@1 
```
outputs the manipulated matrix
```
010
000
000
000
```




# general
Contains generic helper methods.

## FUNCTION IsNullOrEmpty(_input TEXT)
Checks if the given string is NULL or empty.\
Returns 1 if it is, otherwise 0.

### Test Code
```SELECT IsNullOrEmpty(NULL);```							*Returns 1*\
```SELECT IsNullOrEmpty('');```								*Returns 1*\
```SELECT IsNullOrEmpty('Hello world!');```		*Returns 0*  
 
# base32
Contains functions and procedures to encode, decode and test Base32 strings.

## Common Alphabets

See also [Wikipedia Base32](https://en.wikipedia.org/wiki/Base32)

### RFC 4648 §6
```'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'```\
**Exclusion:** `1, 8, 9 and 0`
**Padding:** `=`\

### Crockford's Base32 Alphabet
```'0123456789ABCDEFGHJKMNPQRSTWXYZ'```\
**Exclusion:** `I, L, O and U`

## FUNCTION IsBase32(_input VARCHAR(100), _alphabet CHAR(32),	_paddingChar CHAR)
Checks if the input string matches the given Base32-alphabet.\
Returns 1 if it is, otherwise 0.

### Test Code
```SELECT github.IsBase32(null, null, null);```										*Signals that the first parameter is null or empty*\
```SELECT github.IsBase32('', null, null);```												*Signals that the first parameter is null or empty*\
```SELECT github.IsBase32('ABCDEFGH', null, null);```				*Signals that the second parameter is null or empty*\

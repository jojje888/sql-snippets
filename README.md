# general
Contains generic helper methods.

## FUNCTION IsNullOrEmpty(_input TEXT)
Checks if the given string is NULL or empty.\
Returns 1 if it is, otherwise 0.

### Test Code
```SELECT IsNullOrEmpty(NULL);```							*Returns 1*\
```SELECT IsNullOrEmpty('');```								*Returns 1*\
```SELECT IsNullOrEmpty('Hello world!');```		*Returns 0*  
 

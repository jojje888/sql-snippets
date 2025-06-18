CREATE FUNCTION WordCount(
	_input TEXT,
	_delimiter CHAR
) RETURNS int
    DETERMINISTIC
    COMMENT 'Counts the number of words separated by the _delimiter.'
BEGIN
	IF (IsNullOrEmpty(_input)) THEN
		RETURN 0;
	ELSE
		RETURN LENGTH(_input) - LENGTH(REPLACE(_input, _delimiter, '')) + 1;
	END IF;
END
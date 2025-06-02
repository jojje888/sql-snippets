CREATE FUNCTION IsNullOrEmpty(
	_input TEXT
) 
	RETURNS tinyint(1)
    DETERMINISTIC
    COMMENT 'Returns 1 if a string is null or empty, otherwise 0.'
BEGIN
	RETURN ISNULL(_input) OR (LENGTH(TRIM(_input)) = 0);
END
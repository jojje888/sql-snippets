CREATE FUNCTION IsBase32(
	_input VARCHAR(100),
	_alphabet CHAR(32),
	_paddingChar CHAR
) RETURNS tinyint
    DETERMINISTIC
BEGIN
	DECLARE ix INT DEFAULT 1;
	DECLARE varInputLength INT;
	DECLARE varAlphabet VARCHAR(40);

	IF (IsNullOrEmpty(_input)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The input argument "_input" cannot be null or empty.';
	END IF;

	IF (IsNullOrEmpty(_alphabet)) THEN	
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The input argument "_alphabet" cannot be null or empty.';
	END IF;

	SET varInputLength = LENGTH(_input);
	IF (ISNULL(_paddingChar)) THEN
		SET varAlphabet = _alphabet;
	ELSE
		SET varAlphabet = CONCAT(_alphabet, _paddingChar);
	END IF;

	L1 : LOOP
		IF (ix > inputLength) THEN
			LEAVE L1;		
		END IF;
	
		IF (LOCATE(SUBSTRING(_input, ix, 1), varAlphabet, 1) = 0) THEN
			LEAVE L1;
		END IF;
	
		SET ix = ix + 1;
		ITERATE L1;
	END LOOP;
	
	-- The ix variable will be @inputLength + 1, if all characters have been checked. 
	RETURN IF(ix > varInputLength, 1, 0);
END
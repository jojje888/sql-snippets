CREATE PROCEDURE GetEnumValues(
	IN _database VARCHAR(100),
	IN _table VARCHAR(100),
	IN _column VARCHAR(100)
)
    COMMENT 'Gets the individual enum-members from an ENUM column.'
BEGIN
	DECLARE varEnumList VARCHAR(255);	

	SET varEnumList = (SELECT COLUMN_TYPE
	FROM information_schema.COLUMNS
	WHERE TABLE_SCHEMA = _database
    	AND TABLE_NAME = _table
    	AND COLUMN_NAME = _column);

	IF (IsNullOrEmpty(varEnumList)) THEN
		SET @msg = CONCAT('The column "', _column, '" does not exist in the table "', _database, '"."', _table, '".');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	ELSEIF (varEnumList REGEXP '^enum.*') THEN
		CALL SplitString(REGEXP_SUBSTR(varEnumList, '\'[^\)]+'), ',');
	ELSE
		SET @msg = CONCAT('The column "', _column, '" is not of type ENUM in the table "', _database, '"."', _table, '".');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @msg;
	END IF;	
END
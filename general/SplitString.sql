CREATE PROCEDURE SplitString(
    IN _input VARCHAR(255),
    IN _delimiter CHAR(1)
)
    COMMENT 'Splits a string into a table of trimmed words using the given delimiter.'
BEGIN
    DECLARE pos INT DEFAULT 1;
	DECLARE words INT DEFAULT 0;
    DECLARE str VARCHAR(255);

    CREATE TEMPORARY TABLE temp_strings (Ordinal INT, `Value` VARCHAR(255));
	
    SET words = WordCount(_input, _delimiter);
    REPEAT
        SET str = SUBSTRING_INDEX(SUBSTRING_INDEX(_input, _delimiter, pos), _delimiter, -1);
        IF (str != '') THEN
            INSERT INTO temp_strings (Ordinal, `Value`) VALUES (pos, TRIM(str));
        END IF;
        SET pos = pos + 1;
    UNTIL pos > words END REPEAT;

    SELECT * FROM temp_strings;
    
    DROP TEMPORARY TABLE temp_strings;
END
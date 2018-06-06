CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @result BIT = 1;
	DECLARE @charIndex INT = 1;

	WHILE(@charIndex <= LEN(@word))
	BEGIN
		IF(CHARINDEX(SUBSTRING(@word, @charIndex, 1), @setOfLetters, 1) = 0)
		BEGIN 
			SET @result = 0
			BREAK
		END
		SET @charIndex += 1
	END
	RETURN @result
END
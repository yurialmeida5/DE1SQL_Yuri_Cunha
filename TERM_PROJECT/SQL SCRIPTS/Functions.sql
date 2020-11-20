DELIMITER $$

CREATE FUNCTION fun_ExtractMonth(
	Birthday varchar(50)
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE vMonth Integer;
	SET vMonth = CONVERT(LEFT(Birthday,INSTR(Birthday,"/")-1), UNSIGNED);
    -- return vMonth 
	RETURN (vMonth);

END$$

DELIMITER ;


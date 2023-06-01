-- ciag fibonacciego

CREATE SCHEMA licz;

CREATE FUNCTION licz.Fibonacci(@n INT)
RETURNS INT
AS
BEGIN
    DECLARE @result BIGINT;

    IF @n <= 0
        SET @result = 0;
    ELSE IF @n = 1
        SET @result = 1;
    ELSE
    BEGIN
        DECLARE @fib1 BIGINT = 0;
        DECLARE @fib2 BIGINT = 1;
        DECLARE @i INT = 2;

        WHILE @i <= @n
        BEGIN
            SET @result = @fib1 + @fib2;
            SET @fib1 = @fib2;
            SET @fib2 = @result;
            SET @i = @i + 1;
        END
    END
    RETURN @result;
END;



CREATE PROCEDURE licz.CalculateFibonacci(@n INT)
AS
BEGIN
    DECLARE @i INT = 0;
    DECLARE @fibonacciNumber INT;

    WHILE @i <= @n
    BEGIN
        SET @fibonacciNumber = licz.Fibonacci(@i);
        PRINT 'Liczba ci¹gu Fibonacciego na pozycji ' + CAST(@i AS VARCHAR(30)) + ' to ' + CAST(@fibonacciNumber AS VARCHAR(30));
        SET @i = @i + 1;
    END
END;


DROP PROCEDURE licz.CalculateFibonacci;

EXEC licz.CalculateFibonacci @n = 10; 

/****** Script for SelectTopNRows command from SSMS  ******/

-- 1. Napisz zapytanie, kt�re wykorzystuje transakcj� (zaczynaj�), a nast�pnie aktualizuje cen� produktu o ProductID r�wnym 680 w tabeli Production.
-- Product o 10% i nast�pnie zatwierdza transakcj�.
  BEGIN TRANSACTION
  UPDATE Production.Product SET ListPrice = ListPrice*1.1
  WHERE ProductID = 680;
  COMMIT;

  SELECT * FROM [AdventureWorks2019].[Production].[Product] WHERE ProductID = 680;


  -- 2. Napisz zapytanie, kt�re zaczyna transakcj�, usuwa produkt o ProductID r�wnym 707 z tabeli Production.Product, 
  -- ale nast�pnie wycofuje transakcj�.
  -- ????????????????????????????????????????????

BEGIN TRANSACTION;
BEGIN TRY
    DELETE Production.Product WHERE ProductID = 707;
    COMMIT TRANSACTION;
	PRINT 'Produkt zosta� usuni�ty.'
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Transakcje wycofano.';
END CATCH;
-----------------------------


-- 3. Napisz zapytanie, kt�re zaczyna transakcj�, dodaje nowy produkt do tabeli Production.Product, a nast�pnie zatwierdza transakcj�.

BEGIN TRANSACTION;
INSERT INTO Production.Product (Name, ProductNumber, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate)
VALUES ('Helmet', 'HK-Y56N-98', 'Red', 100, 75, 10.00, 20.00, 1, '2011-05-31 00:00:00.000');
COMMIT TRANSACTION;

SELECT * FROM [AdventureWorks2019].[Production].[Product] WHERE ProductNumber = 'HK-Y56N-98';


-- 4. Napisz zapytanie, kt�re zaczyna transakcj� i aktualizuje StandardCost wszystkich produkt�w w tabeli Production.Producto 10%, 
-- je�eli suma wszystkich StandardCost po aktualizacji nie przekracza 50000. 
-- W przeciwnym razie zapytanie powinno wycofa� transakcj�.

  BEGIN TRANSACTION;
  UPDATE Production.Product SET StandardCost = StandardCost*1.1;
  DECLARE @suma DECIMAL(10, 2);
  SELECT @suma = SUM(StandardCost) FROM Production.Product;
  IF @suma <= 50000 
  BEGIN
	COMMIT;
  END
  ELSE 
  BEGIN
  ROLLBACK TRANSACTION;
  PRINT 'Transakcja odrzucona';
  END


-- 5. Napisz zapytanie SQL, kt�re zaczyna transakcj� i pr�buje doda� nowy produkt do tabeli Production.Product.
-- Je�li ProductNumber ju� istnieje w tabeli, zapytanie powinno wycofa� transakcj�.

BEGIN TRANSACTION;
DECLARE @temp INT;
DECLARE @pnumb VARCHAR(20) = 'HK-Y56N-98' 
SELECT @temp = COUNT(*) FROM Production.Product WHERE ProductNumber = @pnumb; 
IF @temp = 0
BEGIN
	INSERT INTO Production.Product (Name, ProductNumber, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate)
	VALUES ('Helmet', @pnumb, 'Red', 100, 75, 10.00, 20.00, 1, '2011-05-31 00:00:00.000');
	COMMIT;
END
ELSE
BEGIN
ROLLBACK TRANSACTION;
PRINT 'Produkt nie zosta� dodany, poniewa� taki ProductNumber jest juz w bazie.'
END


-- 6. Napisz zapytanie SQL, kt�re zaczyna transakcj� i aktualizuje warto�� OrderQty dla ka�dego zam�wienia w tabeli Sales.SalesOrderDetail.
-- Je�eli kt�rykolwiek z zam�wie� ma OrderQty r�wn� 0, zapytanie powinno wycofa� transakcj�.

BEGIN TRANSACTION;

UPDATE Sales.SalesOrderDetail SET OrderQty = OrderQty - 1;

DECLARE @zero INT;
SELECT @zero = COUNT(*) FROM Sales.SalesOrderDetail WHERE OrderQty = 0;

IF @zero > 0
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transakcj� anulowano, poniewa� OrderQty = 0.';
END
ELSE
BEGIN
    COMMIT;
    PRINT 'Transakcja wykonana.';
END


SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0;

-- 7. Napisz zapytanie SQL, kt�re zaczyna transakcj� i usuwa wszystkie produkty,kt�rych StandardCost 
-- jest wy�szy ni� �redni koszt wszystkich produkt�w w tabeli Production.Product.
--Je�eli liczba produkt�w do usuni�cia przekracza 10, zapytanie powinno wycofa� transakcj�.

BEGIN TRANSACTION;
DECLARE @avgcost DECIMAL (8, 2)
DECLARE @del INT;
SELECT @avgcost = AVG(StandardCost) FROM Production.Product;
SELECT @del = COUNT(*) FROM Production.Product WHERE StandardCost > @avgcost; 
IF @del <= 10
BEGIN
	DELETE Production.Product WHERE StandardCost > @avgcost;
	COMMIT;
	PRINT 'Tarnsakcja wykonana. Produkty zosta�y usuni�te.';
END
ELSE
BEGIN
	ROLLBACK TRANSACTION;
	PRINT 'Transakcja anulowana. Liczba produkt�w do usuni�cia wynosi: '+ CAST(@del AS VARCHAR(10));
END

-- zad1) Wykorzystuj�c wyra�enie CTE zbuduj zapytanie, kt�re znajdzie informacje na temat stawki pracownika oraz jego danych, 
-- a nast�pnie zapisze je do tabeli tymczasowej TempEmployeeInfo. 
-- Rozwi�� w oparciu o AdventureWorks.

WITH EmployeeInfo AS (
  SELECT e.BusinessEntityID, p.FirstName, p.LastName, h.Rate
  FROM HumanResources.EmployeePayHistory AS h
  INNER JOIN HumanResources.Employee AS e ON h.BusinessEntityID = e.BusinessEntityID
  INNER JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID
)
SELECT *
INTO TempEmployeeInfo
FROM EmployeeInfo;

SELECT * FROM TempEmployeeInfo;

-- LUB 

WITH Pracownicy AS (
  SELECT e.BusinessEntityID, p.FirstName, p.LastName, h.Rate
  FROM HumanResources.Employee AS e
  INNER JOIN HumanResources.EmployeePayHistory AS h ON e.BusinessEntityID = h.BusinessEntityID
  INNER JOIN Person.Person AS p ON p.BusinessEntityID = e.BusinessEntityID
)
SELECT *
INTO TempEmployeeInfo2
FROM Pracownicy;
SELECT * FROM TempEmployeeInfo2;


-- zad2) Uzyskaj informacje na tematprzychod�wze sprzeda�y wed�ug firmy i kontaktu (za pomoc� CTEi bazy AdventureWorksLT2019)

WITH Przychody AS (SELECT c.CompanyName AS CompanyContact, h.TotalDue AS Revenue
  FROM SalesLT.Customer AS c
  INNER JOIN SalesLT.SalesOrderHeader AS h ON c.CustomerID = h.CustomerID
)
SELECT * FROM Przychody
ORDER BY CompanyContact;



-- zad3) Napisz zapytanie, kt�re zwr�ci warto�� sprzeda�y dla poszczeg�lnych kategorii produkt�w. Wykorzystaj CTE i baz� AdventureWorksLT2019.

WITH Sprzedaz AS (
  SELECT pc.Name AS Category, od.UnitPrice AS SalesValue
  FROM SalesLT.ProductCategory AS pc
  INNER JOIN SalesLT.Product AS p ON p.ProductCategoryID = pc.ProductCategoryID
  INNER JOIN SalesLT.SalesOrderDetail AS od ON p.ProductID = od.ProductID
)
SELECT Category, SUM(SalesValue) AS TotalSalesValue
FROM Sprzedaz
GROUP BY Category
ORDER BY Category;
  CREATE TRIGGER TR_Nazwisko
  ON Person.Person
  AFTER INSERT
  AS
  BEGIN
      UPDATE Person.Person SET LastName = UPPER(LastName)
  END;


  INSERT INTO Person.BusinessEntity(rowguid)
  VALUES(newid())
  SELECT * FROM [AdventureWorks2019].[Person].[BusinessEntity]
  
  INSERT INTO Person.Person (BusinessEntityID, PersonType, FirstName, MiddleName, LastName) VALUES(20779,'IN', 'Julia', 'Wiktoria', 'Tulin')

  SELECT * FROM [AdventureWorks2019].[Person].[Person]
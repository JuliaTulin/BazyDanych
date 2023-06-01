  CREATE TRIGGER taxRateMonitoring
  ON Sales.SalesTaxRate
  AFTER INSERT, UPDATE, DELETE
  AS
  BEGIN
	DECLARE @newTaxRate SMALLMONEY, @oldTaxRate SMALLMONEY;
	SELECT @newTaxRate = TaxRate FROM inserted;
	SELECT @oldTaxRate = TaxRate FROM deleted;

	IF @newtaxrate > @oldTaxRate*1.3 OR @newtaxrate < @oldTaxRate*0.7
	BEGIN
		PRINT 'B£¥D';	
		ROLLBACK;
	End
  END;

  --DROP TRIGGER taxRateMonitoring;
    
  SELECT * FROM Sales.SalesTaxRate;

  UPDATE Sales.SalesTaxRate SET TaxRate = TaxRate*1.4

USE AdventureWorks2019
GO

IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'Production'
     AND SPECIFIC_NAME = N'usp_InsertarProducto' 
)
   DROP PROCEDURE Production.usp_InsertarProducto
GO

CREATE PROCEDURE Production.usp_InsertarProducto
@IdCategoria INT,
@Nombre NVARCHAR(50),
@Dia DATETIME
AS
BEGIN
	SET IDENTITY_INSERT Production.ProductCategory ON;
	INSERT INTO Production.ProductCategory (ProductCategoryID, Name, rowguid, ModifiedDate)
	VALUES(
	@IdCategoria, @Nombre, NEWID(), @Dia
	)
END
GO

EXECUTE Production.usp_InsertarProducto 6,'ProductoNuevo2','2022-02-02'
GO
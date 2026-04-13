-- drop and recreate database 'restaurant_db'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'ecommerce')
BEGIN
	ALTER DATABASE ecommerce SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE ecommerce;
END;
GO

CREATE DATABASE ecommerce;
GO

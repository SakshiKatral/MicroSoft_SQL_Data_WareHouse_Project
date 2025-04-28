USE master;
GO

--Drop and Recreate the database 'DataWareHouse' 
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWareHouse')
BEGIN
	ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWareHouse;
END;
GO

--Create the database 'DataWareHouse' 
CREATE DATABASE DataWareHouse;
GO

USE DataWareHouse;
GO

-- Create the Schemas
CREATE SCHEMA bronz;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

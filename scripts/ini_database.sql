/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
   What This Script Does:
Database Setup:
It first checks whether a database called DataWarehouse already exists.
If it does, the script deletes (DROP) the old database and creates a fresh one with the same name.
If it doesn’t exist, it simply creates the new DataWarehouse database.
Schema Creation:
Inside the DataWarehouse, it sets up three structured layers (schemas):
bronze – Stores raw, unprocessed data (as it comes in).
silver – Holds cleaned and refined data (ready for analysis).
gold – Contains fully processed, business-ready data (optimized for reporting and decision-making).
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

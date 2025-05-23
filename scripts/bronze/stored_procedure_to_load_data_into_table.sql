This stored procedure loads data into the 'bronze' schema from external CSV files

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		-- delete all rows 
		TRUNCATE TABLE bronze.crm_customer_info;
		--insert info from csv files
		BULK INSERT bronze.crm_customer_info
		FROM 'D:\Sakshi SQL\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		-- delete all rows 
		TRUNCATE TABLE bronze.crm_product_info;
		--insert info from csv files
		BULK INSERT bronze.crm_product_info
		FROM 'D:\Sakshi SQL\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		-- delete all rows 
		TRUNCATE TABLE bronze.crm_sales_details;
		--insert info from csv files
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Sakshi SQL\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		-- delete all rows 
			TRUNCATE TABLE bronze.erp_customer_az12;
		--insert info from csv files
		BULK INSERT bronze.erp_customer_az12
		FROM 'D:\Sakshi SQL\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
			TRUNCATE TABLE bronze.erp_loc_a101;
		--insert info from csv files
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Sakshi SQL\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
			TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		--insert info from csv files
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Sakshi SQL\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
	PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);

	END CATCH
END

use ecommerce;
GO

BULK INSERT orders
FROM 'D:\Project_datasets\ecommerce\train - dataset_cleaned.csv'
WITH (
	FIELDTERMINATOR = ',',
	FIRSTROW = 2,
	TABLOCK
);
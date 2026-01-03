CREATE DATABASE RetailAnalytics;
GO
USE RetailAnalytics;





CREATE TABLE staging_sales (
    InvoiceNo   VARCHAR(MAX),
    StockCode   VARCHAR(MAX),
    Description VARCHAR(MAX),
    Quantity    VARCHAR(MAX),
    InvoiceDate VARCHAR(MAX),
    UnitPrice   VARCHAR(MAX),
    CustomerID  VARCHAR(MAX),
    Country     VARCHAR(MAX),
    TotalPrice  VARCHAR(MAX),
    OrderDate   VARCHAR(MAX),
    OrderMonth  VARCHAR(MAX)
);







BULK INSERT staging_sales
FROM 'C:\Temp\cleaned_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',  
    CODEPAGE = '65001',
    FORMAT = 'CSV',  
    TABLOCK,
    ERRORFILE = 'C:\Temp\bulk_errors.log'  -- برای ردیابی خطاها
);






SELECT TOP 10 * FROM staging_sales;

SELECT COUNT(*) FROM staging_sales;




DROP TABLE IF EXISTS dim_customer;
GO

CREATE TABLE dim_customer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID  VARCHAR(20),
    Country     VARCHAR(50)
);





INSERT INTO dim_customer (CustomerID, Country)
SELECT DISTINCT
    CustomerID,
    Country
FROM fact_sales
WHERE CustomerID IS NOT NULL;



--------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS dim_product;
GO

CREATE TABLE dim_product (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    StockCode  VARCHAR(20),
    Description VARCHAR(255)
);




INSERT INTO dim_product (StockCode, Description)
SELECT DISTINCT
    StockCode,
    Description
FROM fact_sales;





----------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS dim_date;
GO

CREATE TABLE dim_date (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Month INT,
    MonthName VARCHAR(20),
    Day INT
);








INSERT INTO dim_date (DateKey, FullDate, Year, Month, MonthName, Day)
SELECT DISTINCT
    CONVERT(INT, FORMAT(InvoiceDate, 'yyyyMMdd')) AS DateKey,
    CAST(InvoiceDate AS DATE) AS FullDate,
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    DATENAME(MONTH, InvoiceDate) AS MonthName,
    DAY(InvoiceDate) AS Day
FROM fact_sales
WHERE InvoiceDate IS NOT NULL;



-------------------------------------------------------------------------------------------------------

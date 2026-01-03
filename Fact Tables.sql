DROP TABLE IF EXISTS fact_sales;
GO

CREATE TABLE fact_sales (
    InvoiceNo      VARCHAR(20),
    StockCode      VARCHAR(20),
    Description    VARCHAR(255),
    Quantity       INT,
    InvoiceDate    DATETIME,
    UnitPrice      DECIMAL(10,2),
    CustomerID     VARCHAR(20),
    Country        VARCHAR(50),
    TotalPrice     DECIMAL(12,2),
    OrderDate      DATE,
    OrderMonth     CHAR(7)
);







TRUNCATE TABLE fact_sales;




INSERT INTO fact_sales
SELECT
    InvoiceNo,
    StockCode,
    Description,

    TRY_CAST(Quantity AS INT) AS Quantity,

    TRY_PARSE(InvoiceDate AS DATETIME USING 'en-GB') AS InvoiceDate,

    TRY_CAST(UnitPrice AS DECIMAL(10,2)) AS UnitPrice,

    CustomerID,
    Country,

    TRY_CAST(TotalPrice AS DECIMAL(12,2)) AS TotalPrice,

    TRY_PARSE(OrderDate AS DATE USING 'en-GB') AS OrderDate,

    LEFT(OrderMonth, 7) AS OrderMonth

FROM staging_sales
WHERE
    TRY_CAST(Quantity AS INT) IS NOT NULL
    AND TRY_CAST(UnitPrice AS DECIMAL(10,2)) IS NOT NULL
    AND TRY_PARSE(InvoiceDate AS DATETIME USING 'en-GB') IS NOT NULL;




SELECT COUNT(*) FROM fact_sales;
SELECT TOP 10 * FROM fact_sales;

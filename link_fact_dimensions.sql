ALTER TABLE fact_sales ADD CustomerKey INT;
ALTER TABLE fact_sales ADD ProductKey INT;
ALTER TABLE fact_sales ADD DateKey INT;

------------------------------------------

UPDATE f
SET CustomerKey = c.CustomerKey
FROM fact_sales f
JOIN dim_customer c
    ON f.CustomerID = c.CustomerID;

------------------------------------------

UPDATE f
SET ProductKey = p.ProductKey
FROM fact_sales f
JOIN dim_product p
    ON f.StockCode = p.StockCode;

------------------------------------------

UPDATE fact_sales
SET DateKey = CONVERT(INT, FORMAT(InvoiceDate, 'yyyyMMdd'));

------------------------------------------


ALTER TABLE fact_sales
ADD CONSTRAINT fk_customer FOREIGN KEY (CustomerKey) REFERENCES dim_customer(CustomerKey);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_product FOREIGN KEY (ProductKey) REFERENCES dim_product(ProductKey);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_date FOREIGN KEY (DateKey) REFERENCES dim_date(DateKey);


----------------------------------------------------------------------------



SELECT TOP 10 CustomerKey, ProductKey, DateKey FROM fact_sales;
-----------------------------------------------------
--Total Revenue
SELECT SUM(TotalPrice) AS TotalRevenue
FROM fact_sales;
-----------------------------------------------------
--Monthly Revenue
SELECT
    d.Year,
    d.Month,
    SUM(f.TotalPrice) AS MonthlyRevenue
FROM fact_sales f
JOIN dim_date d ON f.DateKey = d.DateKey
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;
-----------------------------------------------------
--Top 10 Customers
SELECT TOP 10
    c.CustomerID,
    SUM(f.TotalPrice) AS Revenue
FROM fact_sales f
JOIN dim_customer c ON f.CustomerKey = c.CustomerKey
GROUP BY c.CustomerID
ORDER BY Revenue DESC;
-----------------------------------------------------
--Top 10 Products
SELECT TOP 10
    p.StockCode,
    SUM(f.Quantity) AS TotalSold
FROM fact_sales f
JOIN dim_product p ON f.ProductKey = p.ProductKey
GROUP BY p.StockCode
ORDER BY TotalSold DESC;
-----------------------------------------------------














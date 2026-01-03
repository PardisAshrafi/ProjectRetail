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
-- Average Order Value
SELECT 
    SUM(TotalPrice) / COUNT(DISTINCT InvoiceNo) AS AvgOrderValue
FROM fact_sales;
------------------------------------------------------
-- Total Orders
SELECT COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM fact_sales;
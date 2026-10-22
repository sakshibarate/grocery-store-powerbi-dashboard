-- Grocery store sales database starter (SQL Server syntax)
CREATE DATABASE GroceryStoreDB;
GO
USE GroceryStoreDB;
GO

CREATE TABLE SalesData (
    OrderID VARCHAR(20) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    Store VARCHAR(80),
    Product VARCHAR(120),
    Category VARCHAR(80),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2),
    DiscountPct DECIMAL(5,4),
    SalesAmount DECIMAL(12,2),
    CostAmount DECIMAL(12,2),
    Profit DECIMAL(12,2),
    PaymentMethod VARCHAR(40),
    Channel VARCHAR(30),
    CustomerType VARCHAR(30)
);
GO

-- After importing the CSV through SSMS Import Flat File / Import Data,
-- use these queries to validate and explore:
SELECT SUM(SalesAmount) AS TotalSales, SUM(Profit) AS TotalProfit
FROM SalesData;

SELECT Category, SUM(SalesAmount) AS Sales, SUM(Profit) AS Profit
FROM SalesData
GROUP BY Category
ORDER BY Sales DESC;

SELECT Product, SUM(Quantity) AS UnitsSold, SUM(SalesAmount) AS Sales
FROM SalesData
GROUP BY Product
ORDER BY Sales DESC;

SELECT Store, COUNT(DISTINCT OrderID) AS Orders, SUM(SalesAmount) AS Sales
FROM SalesData
GROUP BY Store
ORDER BY Sales DESC;

SELECT FORMAT(OrderDate, 'yyyy-MM') AS SalesMonth, SUM(SalesAmount) AS Sales
FROM SalesData
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY SalesMonth;

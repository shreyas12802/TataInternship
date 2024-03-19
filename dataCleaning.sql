SELECT * FROM [Tata data analysis]..onlineRetail

-- check for number of null values

SELECT * FROM [Tata data analysis]..onlineRetail
WHERE CustomerID is NULL 

-- Delete null value rows

DELETE FROM [Tata data analysis]..onlineRetail
WHERE CustomerID is NULL 

SELECT * FROM [Tata data analysis]..onlineRetail
WHERE Description is NULL 
OR InvoiceNo is NULL
OR StockCode is NULL
OR Quantity is NULL
OR InvoiceDate is NULL
OR UnitPrice is NULL
OR Country is NULL

DELETE FROM [Tata data analysis]..onlineRetail
WHERE InvoiceNO is NULL 

SELECT * FROM [Tata data analysis]..onlineRetail
WHERE Quantity < 1

SELECT * FROM [Tata data analysis]..onlineRetail
WHERE UnitPrice < 0

SELECT * FROM [Tata data analysis]..onlineRetail

SELECT YEAR(InvoiceDate) AS year FROM [Tata data analysis]..onlineRetail;

ALTER TABLE [Tata data analysis]..onlineRetail
ADD year INT;

UPDATE [Tata data analysis]..onlineRetail
SET year = YEAR(InvoiceDate)

ALTER TABLE [Tata data analysis]..onlineRetail
ADD Month VARCHAR(20);

UPDATE [Tata data analysis]..onlineRetail
SET Month = DATENAME(month, InvoiceDate)

ALTER TABLE [Tata data analysis]..onlineRetail
ADD sales FLOAT;

UPDATE [Tata data analysis]..onlineRetail
SET sales = Quantity*UnitPrice

SELECT Month , SUM(sales) as TotalSales FROM [Tata data analysis]..onlineRetail
GROUP BY(Month)
ORDER BY TotalSales DESC

--November Month has highest sales

SELECT * FROM [Tata data analysis]..onlineRetail
WHERE Description LIKE '%+%';

UPDATE [Tata data analysis]..onlineRetail
SET Description = REPLACE(Description, '+', 'and');

SELECT * FROM [Tata data analysis]..onlineRetail
WHERE Description LIKE '%,%';

UPDATE [Tata data analysis]..onlineRetail
SET Description = REPLACE(Description, ',', 'and');

SELECT DISTINCT(Month) FROM [Tata data analysis]..onlineRetail
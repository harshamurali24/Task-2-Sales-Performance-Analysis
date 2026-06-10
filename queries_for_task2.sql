USE task2;
SELECT *
FROM orders
LIMIT 10;
SELECT *
FROM customers_table
LIMIT 10;
SELECT
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Region,
    o.Product_Category,
    o.Sales,
    o.Profit
FROM orders o
INNER JOIN customers_table c
ON o.Customer_ID = c.Customer_ID
LIMIT 10;
SELECT
    c.Region,
    ROUND(SUM(o.Sales), 2) AS Total_Sales
FROM orders o
INNER JOIN customers_table c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Total_Sales DESC;
SELECT
    Product_Category,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM orders
GROUP BY Product_Category
ORDER BY Profit_Margin_Percent DESC;
SELECT
    c.Customer_Name,
    ROUND(SUM(o.Sales), 2) AS Revenue
FROM orders o
INNER JOIN customers_table c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Revenue DESC
LIMIT 5;
SELECT
    c.Segment,
    ROUND(SUM(o.Sales), 2) AS Total_Sales
FROM orders o
INNER JOIN customers_table c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Segment
ORDER BY Total_Sales DESC;
SELECT
    c.Region,
    ROUND(SUM(o.Profit), 2) AS Total_Profit
FROM orders o
INNER JOIN customers_table c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Total_Profit DESC;
SELECT
    MONTH(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Month_No,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM orders
GROUP BY Month_No
ORDER BY Month_No;
SELECT
    Segment,
    COUNT(*) AS Customers
FROM customers_table
GROUP BY Segment
ORDER BY Customers DESC;
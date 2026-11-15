USE ecommerce_sales;

SELECT TOP 5 *
FROM customers;

SELECT TOP 5 *
FROM products;

SELECT TOP 5 *
FROM sales;

-- Total sales per State

SELECT
	S.State,
	SUM(S.Total_Amount) AS Total_sales
FROM sales S
GROUP BY S.State;

-- 
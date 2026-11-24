USE ecommerce_sales;

-- ============================================================
-- DAY 01 - SELECT and WHERE Basics  (25 questions)
-- Topics: Pick columns, limit rows, simple conditions
-- ============================================================

-- Q1. Show all columns and all rows from the customers table.

SELECT TOP 5 * 
FROM customers;

-- Q2. Show only Customer_Name and City from customers.

SELECT TOP 5 *,
	Customer_Name,
	City
FROM customers;

-- Q3. Show the first 10 rows of products.

SELECT TOP 10 *
FROM products;

-- Q4. Count how many rows are in the sales table.

SELECT
	COUNT(*) AS count_rows
FROM sales;

-- Q5. Show all customers from the state of Delhi.

SELECT TOP 5 *
FROM customers
WHERE State = 'Delhi'; -- STR

-- Q6. Show all customers whose tier is Gold.

SELECT TOP 5 *
FROM customers
WHERE Customer_Tier = 'Gold'; -- STR

-- Q7. Show customers older than 60.

SELECT TOP 10 *
FROM customers
WHERE Age > 60; -- INT

-- Q8. Show customers aged 25 or younger.

SELECT TOP 4 *
FROM customers
WHERE Age >= 25;

-- Q9. Show Electronics products of the brand Apple.

SELECT TOP 10 *
FROM products
WHERE Brand = 'Apple';

-- Q10. Show customers who live in Delhi OR Karnataka.

SELECT TOP 10 *
FROM customers
WHERE State IN ('Delhi','Karnataka');

-- Q11. Show customers whose tier is NOT Silver (use <>).

SELECT TOP 10 *
FROM customers
WHERE Customer_Tier <> 'Silver';

-- Q12. Show Customer_Name as Name and Total_Spent as Spend (use aliases).

SELECT TOP 10 *,
	Customer_Name AS Name,
	Total_Spent AS Spend
FROM customers;

-- Q13. Show Product_Name and a new column Stock_Value = Selling_Price x Stock_Quantity.

SELECT TOP 10 *,
	Product_Name,
	(Selling_Price * Stock_Quantity) AS Stock_Value	
FROM products;

-- Q14. Show Delivered orders with Total_Amount above 50000.

SELECT TOP 10 *
FROM sales
WHERE Order_Status = 'Delivered' AND 
	  Total_Amount > 50000;

-- Q15. Show orders paid by COD that were Returned.

SELECT TOP 10 *
FROM sales
WHERE Payment_Mode = 'COD' AND
	  Order_Status = 'Returned';

-- Q16. Show products with Discount_Percent greater than 40.

SELECT TOP 10 *
FROM products
WHERE Discount_Percent > 40;

-- Q17. Show products with Selling_Price below 500.

SELECT TOP 10 *
FROM products
WHERE Selling_Price < 500;

-- Q18. Show customers registered after 2024-01-01.

SELECT TOP 10 *
FROM customers
WHERE Registration_Date > '2024-01-01' -- DATE NEEDS QUOTES
ORDER BY Registration_Date ASC;

-- Q19. Show all orders placed from Chennai.

SELECT TOP 10 *
FROM sales
WHERE City = 'Chennai';

-- Q20. Show customers who have never ordered (Total_Orders = 0).

SELECT TOP 10 *
FROM customers
WHERE Total_Orders = 0;

-- Q21. Show products rated 4.5 or higher.

USE ecommerce_sales;

SELECT TOP 5 *
FROM products
WHERE Avg_Rating >= 4.5;

-- Q22. Show orders with Quantity = 3 where a coupon discount was given (Coupon_Discount > 0).

SELECT TOP 5 *
FROM sales
WHERE Quantity = 3 AND Coupon_Discount > 0;

-- Q23. Show all products that are NOT in the Electronics category.

SELECT TOP 5 *
FROM products
WHERE Category <> 'Electronics';

-- Q24. Show customers from Maharashtra who spent more than 100000.

SELECT TOP 5 *
FROM customers
WHERE State = 'Maharashtra' AND Total_Spent > 100000;

-- Q25. Show Customer_Name, Age, Customer_Tier of female Platinum customers older than 40.

SELECT TOP 5 *,
	Customer_Name,
	Age,
	Customer_Tier
FROM customers
WHERE Gender = 'female' AND Customer_Tier = 'Platinum';

-- ============================================================
-- DAY 02 - Filtering Operators  (25 questions)
-- Topics: IN, NOT IN, BETWEEN, LIKE, IS NULL, AND/OR precedence
-- ============================================================

-- Q1. Show customers from Delhi, Gujarat or Rajasthan using IN.

SELECT TOP 20 *
FROM customers
WHERE State IN ('Delhi', 'Gujarat', 'Rajasthan');

-- Q2. Show customers NOT from Delhi, Gujarat or Rajasthan using NOT IN.

SELECT TOP 20 *
FROM customers
WHERE State NOT IN ('Delhi', 'Gujarat', 'Rajasthan');

-- Q3. Show customers aged between 30 and 40 (both included).

SELECT TOP 20 *
FROM customers
WHERE Age BETWEEN 30 AND 40
ORDER BY AGE ASC;

-- Q4. Show orders placed in January 2025 using BETWEEN on Order_Date.

SELECT TOP 5 *
FROM sales
WHERE Order_Date BETWEEN '01-JAN-2026' AND '31-JAN-2026'
ORDER BY Order_Date DESC;

-- Q5. Show customers whose name starts with 'A'.

SELECT TOP 5 *
FROM customers
WHERE Customer_Name LIKE 'A%';

-- Q6. Show customers whose name ends with 'Kumar'.

SELECT TOP 5 *
FROM customers
WHERE Customer_Name LIKE '%Kumar'

-- Q7. Show customers whose email contains 'sharma'.

SELECT TOP 5 *
FROM customers
WHERE Email LIKE '%sharma%';

-- Q8. Show cities whose SECOND letter is 'u' (use _).

SELECT TOP 5 *
FROM customers
WHERE City LIKE '_u%';

-- Q9. Show customers whose phone starts with +91-98.

SELECT TOP 5 *
FROM customers
WHERE Phone LIKE '+91-98%';

-- Q10. Show customers having a Gmail address (email ends with @gmail.com).

SELECT TOP 5 *
FROM customers
WHERE Email LIKE '%@gmail.com';

-- Q11. Show orders where no coupon was used (Coupon_Code is NULL).

SELECT TOP 5 *
FROM sales
WHERE Coupon_Code IS NULL;

-- Q12. Show orders that have a rating (Rating is NOT NULL).

SELECT TOP 5 *
FROM sales
WHERE Rating IS NOT NULL;

-- Q13. Show orders with Rating 4 or above (NULLs will not appear automatically).

SELECT TOP 5 *
FROM sales
WHERE Rating >= 4;

-- Q14. Show Gold customers who live in Delhi OR Punjab. Use brackets correctly.

SELECT TOP 5 *
FROM customers
WHERE Customer_Tier = 'Gold' AND State IN ('Delhi','Punjab')
ORDER BY State;

-- Q15. Show Fashion products of brand Nike or Puma.

SELECT TOP 10 *
FROM products
WHERE Brand = 'Nike' OR Brand = 'Puma';

-- Q16. Show products priced between 1000 and 5000 with a discount of 10, 20 or 30 percent.

SELECT TOP 10 * 
FROM sales
WHERE Unit_Price BETWEEN 1000 AND 5000 
  AND Coupon_Discount IN ( 10, 20, 30);

-- Q17. Show customers whose name contains 'Singh' anywhere.

SELECT TOP 10 *
FROM customers
WHERE Customer_Name LIKE '%Singh%';

-- Q18. Show customers whose name does NOT contain 'Kumar' (NOT LIKE).

SELECT TOP 10 *
FROM customers
WHERE Customer_Name NOT LIKE '%Kumar%';

-- Q19. Show customers with pincode between 110000 and 110099.

SELECT TOP 10 *
FROM customers
WHERE Pincode BETWEEN 110000 AND 110099;

-- Q20. Show customers whose name starts with A, B or C using [ ].

SELECT TOP 10 *
FROM customers
WHERE Customer_Name LIKE '[ABC]%';

-- OPPOSIT

SELECT TOP 10 *
FROM customers
WHERE Customer_Name LIKE '%[XYZ]';

-- Q21. Show customers whose name does NOT start with a vowel ([^ ]).

SELECT TOP 5 *
FROM customers
WHERE Customer_Name LIKE '[^AEIOUaeiou]%';

-- OPPOSIT -- END WITH

SELECT TOP 5 *
FROM customers
WHERE Customer_Name LIKE '%[^AEIOUaeiou]';

-- Q22. Show customers registered in September 2023 using >= and < (no BETWEEN).

SELECT TOP 5 *
FROM customers
WHERE Registration_Date >= '1-SEP-2023' AND Registration_Date < '01-OCT-2023';

-- Q23. Show Cancelled or Returned orders that were NOT paid by COD.

SELECT TOP 10 *
FROM sales
WHERE (Order_Status = 'Cancelled' OR 
	  Order_Status = 'Returned') AND 
	  Payment_Mode <> 'COD';

-- Q24. Show Gold or Platinum customers who have 5 to 10 orders.

SELECT TOP 5 *
FROM customers
WHERE Customer_Tier IN ('Gold','Platinum') AND
	  Total_Orders BETWEEN 5 AND 10;

-- Q25. Show brands that have exactly 4 letters and start with 'N' (_ for one character).

SELECT *
FROM products
WHERE Brand LIKE 'N___';

-- ============================================================
-- DAY 03 - Sorting, TOP, DISTINCT and Paging  (26 questions)
-- Topics: ORDER BY, TOP, TOP WITH TIES, DISTINCT, OFFSET-FETCH
-- ============================================================

-- Q1. Show all customers sorted by Customer_Name A to Z.

SELECT TOP 10 *
FROM customers
ORDER BY Customer_Name ASC;

-- Q2. Show all products sorted by Selling_Price, highest first.

SELECT TOP 10 *
FROM products
ORDER BY Selling_Price DESC;

-- Q3. Show the 10 most expensive products (by Selling_Price).

SELECT 
	   TOP 10 Product_Name,
	   Selling_Price
FROM products
ORDER BY Selling_Price DESC;

-- Q4. Show the 5 youngest customers.

SELECT TOP 5 * 
FROM customers 
ORDER BY Age ASC;

-- Q5. Sort customers by State A to Z, then by Total_Spent highest first inside each state.

SELECT *
FROM customers
ORDER BY State ASC,
		 Total_Spent DESC;

-- Q6. Show the list of unique states in customers.

SELECT DISTINCT(State) AS Unique_state
FROM customers;

-- Q7. Show the unique Payment_Mode values in sales.

SELECT DISTINCT(Payment_Mode) AS Unique_payment_method
FROM sales;

-- Q8. Show unique combinations of State and City from customers.

SELECT 
	DISTINCT State, City
FROM customers
ORDER BY State ASC;

-- Q9. Count how many different cities exist in customers.

SELECT
	COUNT(DISTINCT(City)) AS Unique_city
FROM customers;

-- Q10. Show the 10 highest Total_Amount orders that are Delivered.

SELECT TOP 10 *
FROM sales
WHERE Order_Status = 'Delivered'
ORDER BY Total_Amount DESC;

-- Q11. Show the top 5 products by Avg_Rating using TOP 5 WITH TIES.

USE ecommerce_sales;

SELECT TOP 5 WITH TIES *
FROM products
ORDER BY Avg_Rating DESC;

-- Q12. Show the top 1 PERCENT of customers by Total_Spent.

SELECT TOP 1 PERCENT *
FROM customers
ORDER BY Total_Spent DESC;

-- Q13. Using OFFSET ... FETCH, skip the first 10 customers and show the next 10 (order by Customer_ID).

SELECT *
FROM customers
ORDER BY Customer_ID
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

-- Q14. Page 3 of products with 25 rows per page (order by Product_ID).

SELECT *
FROM products
ORDER BY Product_ID
OFFSET 50 ROWS
FETCH NEXT 25 ROWS ONLY;

-- Q15. Show the 5 products with the highest stock value (Selling_Price x Stock_Quantity), sorting by the expression.

SELECT TOP 5 *,
	   (Selling_Price*Stock_Quantity) AS highest_stock_value
FROM products
ORDER BY highest_stock_value DESC;

-- Q16. Show Customer_Name, Age sorted by the 2nd column (column position) highest first.

SELECT
	Customer_Name,
	Age
FROM customers
ORDER BY 2 DESC; -- AS IN ORDER BY 2ND ITEM i.e. AGE

-- Q17. Show the 10 latest orders using Order_Date then Order_Time (both newest first).

SELECT TOP 10 *
FROM sales
ORDER BY Order_Date DESC, Order_Time DESC;

-- Q18. Find the cheapest product in the Grocery category.

SELECT TOP 1 *
FROM products
WHERE Category = 'Grocery'
ORDER BY Selling_Price ASC;

-- Q19. Show the 10 best rated products that have at least 100 reviews.

SELECT TOP 10 *
FROM products
WHERE Total_Reviews >= 100
ORDER BY Avg_Rating DESC;

-- Q20. Count how many different customers have placed at least one order (use sales).

SELECT
	COUNT(DISTINCT Customer_ID) AS number_of_cust
FROM customers
WHERE Total_Orders >= 1;

--

SELECT 
    COUNT(DISTINCT Customer_ID) AS number_of_cust
FROM sales;

-- Q21. Show unique non-NULL coupon codes used in sales.

SELECT
	DISTINCT(Coupon_Code) AS Distinct_code
FROM sales
WHERE Coupon_Code IS NOT NULL;

-- Q22. Sort customers in this custom order: Platinum, Gold, Silver (use CASE inside ORDER BY).

SELECT *
FROM customers
ORDER BY
	CASE Customer_Tier
		  WHEN 'Platinum' THEN 1
		  WHEN 'Gold' THEN 2
		  WHEN 'Silver' THEN 3
		  ELSE 4
	END;
	

-- Q23. Show the 3 earliest registered customers from Gujarat.



-- Q24. Show 15 orders: highest Quantity first, and for equal quantity the lowest Total_Amount first.



-- Q25. Show the latest 5 Cancelled orders.



-- Q26. Show unique Customer_Age_Group values in sales, sorted A to Z.



-- ============================================================
-- DAY 04 - Aggregates, GROUP BY and HAVING  (30 questions)
-- Topics: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
-- ============================================================
-- Q1. Count the total number of customers.
-- Q2. Find the total sales amount (SUM of Total_Amount).
-- Q3. Find the average Selling_Price of products.
-- Q4. Find the minimum and maximum customer Age in one query.
-- Q5. Show COUNT(*) and COUNT(Rating) from sales together. Why are they different?
-- Q6. Find the total revenue from Delivered orders only.
-- Q7. Find the average Avg_Rating of Electronics products.
-- Q8. Count customers in each State.
-- Q9. Count orders for each Order_Status.
-- Q10. Find total revenue for each Payment_Mode.
-- Q11. Find the average product price per Category, rounded to 2 decimals.
-- Q12. Find the cheapest and costliest product for each Brand.
-- Q13. Count customers for each Customer_Tier and Gender combination.
-- Q14. Show states that have more than 4000 customers (HAVING).
-- Q15. Show brands that have more than 50 products.
-- Q16. Show payment modes whose total revenue is above 1 crore (10000000).
-- Q17. Count Delivered orders per state and show only states with more than 20000 (use both WHERE and HAVING).
-- Q18. Find total revenue for each year (use YEAR(Order_Date)).
-- Q19. Find the number of orders in each month of 2025.
-- Q20. Count Returned orders for each Payment_Mode.
-- Q21. Find the top 10 products by total Quantity sold.
-- Q22. Find customers who placed more than 12 orders.
-- Q23. Find the average order value (Total_Amount) for each Customer_Age_Group.
-- Q24. Find total revenue per Coupon_Code, leaving out orders with no coupon.
-- Q25. Count Cancelled orders per state, highest first.
-- Q26. Find the 5 customers with the highest single order Total_Amount.
-- Q27. Find the total Coupon_Discount given for each coupon code.
-- Q28. Count how many DIFFERENT customers ordered from each state.
-- Q29. Show categories with at least 200 products and average rating above 3.
-- Q30. Compare AVG(Rating) with AVG(ISNULL(Rating, 0)) in sales. Which one is correct for 'average rating'?

-- ============================================================
-- DAY 05 - String Functions  (25 questions)
-- Topics: LEN, UPPER, LOWER, LEFT, RIGHT, SUBSTRING, CHARINDEX, REPLACE, TRIM, CONCAT
-- ============================================================
-- Q1. Show Customer_Name and its length using LEN.
-- Q2. Show customer names in UPPER case.
-- Q3. Show City in lower case.
-- Q4. Show the first 3 letters of each customer name using LEFT.
-- Q5. Show the last 4 digits of each phone number using RIGHT.
-- Q6. Show the 10-digit number from Phone (skip '+91-') using SUBSTRING.
-- Q7. Show the email domain (text after @) using CHARINDEX and SUBSTRING.
-- Q8. Show the email username (text before @).
-- Q9. Show the first name of each customer (text before the first space).
-- Q10. Show the last name (text after the first space).
-- Q11. Show Customer_Name - City as one column using CONCAT.
-- Q12. Replace 'gmail' with 'mail' in Email (display only).
-- Q13. Remove '+91-' from Phone using REPLACE.
-- Q14. Remove the extra spaces from the text '   SQL Server   ' on both sides.
-- Q15. Show customer names reversed using REVERSE.
-- Q16. Show customers whose first name starts with 'A' and whose full name is longer than 12 characters.
-- Q17. Count customers for each email domain.
-- Q18. Mask the phone: keep the first 7 characters and replace the rest with X (REPLICATE).
-- Q19. Mask the email: first 2 letters, then ***, then the domain part starting from @.
-- Q20. Show initials: first letter of name + first letter of city (example: AP).
-- Q21. Show products whose name contains the word 'Mobile' using CHARINDEX.
-- Q22. Show the last word of Product_Name (version like V5). Use RIGHT, REVERSE, CHARINDEX.
-- Q23. Count the words in each customer name (hint: count spaces + 1).
-- Q24. Convert Customer_ID like CUST00000123 into the number 123.
-- Q25. For each category, list its brands in one cell using STRING_AGG (SQL Server 2017+).

-- ============================================================
-- DAY 06 - Date and Numeric Functions  (25 questions)
-- Topics: GETDATE, YEAR, DATEPART, DATENAME, DATEDIFF, DATEADD, EOMONTH, ROUND, CEILING
-- ============================================================
-- Q1. Show today's date and time, and today's date only (GETDATE, CAST).
-- Q2. Show Order_ID, Order_Date and the year of each order.
-- Q3. Show the month number and day number of each order date.
-- Q4. Show the weekday name of each order (DATENAME).
-- Q5. Show the quarter of each order using DATEPART.
-- Q6. Show days taken to deliver each order (DATEDIFF).
-- Q7. Show orders that took more than 5 days to deliver.
-- Q8. Find the average delivery days for each state.
-- Q9. Show the return deadline = Delivery_Date + 7 days (DATEADD).
-- Q10. Show orders from the 30 days before the latest order date in the table.
-- Q11. Show the last date of the month for each order date (EOMONTH).
-- Q12. Show the first date of the month for each order using DATEFROMPARTS.
-- Q13. Show orders placed on Saturday or Sunday.
-- Q14. Show month name and total revenue for 2025, in month order.
-- Q15. Show revenue for each year and quarter.
-- Q16. Show customers born in the 1990s.
-- Q17. Show customers whose birthday is in March (use MONTH).
-- Q18. Show orders delivered within 2 days.
-- Q19. Join Order_Date and Order_Time into one datetime column.
-- Q20. Count orders per hour of the day (DATEPART(HOUR, ...)), busiest hour first.
-- Q21. Round Unit_Price to 0 decimals using ROUND.
-- Q22. Show Avg_Rating with CEILING and FLOOR.
-- Q23. Show the difference between Age and 30 as a positive number using ABS.
-- Q24. Show customers with an even age using % (modulo).
-- Q25. Run 7/2 and 7/2.0. What is the difference? Then show Selling_Price divided by Stock_Quantity safely (no integer-division or divide-by-zero error).

-- ============================================================
-- DAY 07 - CASE, NULL Handling, Conversions and Revision  (25 questions)
-- Topics: CASE, IIF, ISNULL, COALESCE, NULLIF, CAST, CONVERT, FORMAT, data checks
-- ============================================================
-- Q1. Label each customer 'Senior' if Age >= 60, else 'Adult' using CASE.
-- Q2. Create age groups: below 30 = 'Young', 30 to 50 = 'Mid', above 50 = 'Senior'.
-- Q3. Create price bands for products: below 1000 = 'Low', 1000 to 10000 = 'Medium', above 10000 = 'High'.
-- Q4. Use simple CASE: Platinum = 20, Gold = 10, Silver = 5 as Reward_Percent.
-- Q5. For each state, count Delivered orders using SUM(CASE WHEN ...).
-- Q6. For each Payment_Mode, show counts of Delivered, Cancelled and Returned orders as 3 separate columns.
-- Q7. Show Coupon_Code, replacing NULL with 'No Coupon' using ISNULL.
-- Q8. Show the first non-NULL value among Coupon_Code, Review_Text and 'None' using COALESCE.
-- Q9. Show the number of orders where Rating is missing, using COUNT(*) and WHERE.
-- Q10. Show average order value per customer = Total_Spent / Total_Orders, avoiding divide-by-zero with NULLIF.
-- Q11. Show Order_Value converted to an integer using CAST.
-- Q12. Show Order_Date in dd/mm/yyyy format using CONVERT style 103.
-- Q13. Show Order_Date like 05-Jan-2025 using FORMAT.
-- Q14. What does TRY_CAST('12x' AS INT) return? Compare with TRY_CAST('12' AS INT).
-- Q15. Show Total_Spent with comma formatting, like 40,098.48.
-- Q16. Show 'Senior' or 'Not Senior' using IIF.
-- Q17. Find total value of Cancelled and Returned orders (lost revenue) for each state.
-- Q18. Data check: count orders where Coupon_Discount > 0 but Coupon_Code is NULL.
-- Q19. Data check: show orders that have a Rating but are NOT Delivered.
-- Q20. Data check: show products where Selling_Price is greater than Original_Price.
-- Q21. Data check: find duplicate emails in customers.
-- Q22. Data check: show customers with Total_Orders = 0 but Total_Spent > 0.
-- Q23. Revision: for each state show Orders, Revenue and Average Order Value (rounded to 2), highest revenue first.
-- Q24. Revision: show the top 5 states by Cancelled-order percentage.
-- Q25. Revision: 2025 monthly report with month name, orders, revenue and Delivered %, in month order.

-- SQL SERVER INTERVIEW PRACTICE - WEEK 2 (INTERMEDIATE) QUESTIONS
-- Tables: customers, products, sales
-- Note: For Day 12 and Day 13, work on COPIES of the tables (create them with SELECT INTO) so the original data stays safe.

-- ============================================================
-- DAY 08 - JOINS (INNER, LEFT, RIGHT, FULL)  (25 questions)
-- ============================================================
-- Q1. Show Order_ID, Customer_Name and City by joining sales with customers (INNER JOIN).
-- Q2. Show Order_ID, Product_Name and Category by joining sales with products.
-- Q3. Show Customer_Name, Product_Name and Total_Amount for the first 20 orders (join all three tables).
-- Q4. Show all customers and their orders using LEFT JOIN. Show Customer_Name and Order_ID.
-- Q5. Find customers who have never placed an order (LEFT JOIN with IS NULL).
-- Q6. Find products that have never been sold.
-- Q7. Count how many orders each customer placed, including customers with 0 orders.
-- Q8. Count how many times each product was sold, including products with 0 sales.
-- Q9. Show total revenue per Category (sales joined to products).
-- Q10. Show total revenue per Brand, highest first.
-- Q11. Show total revenue per Customer_Tier.
-- Q12. Show total revenue per State of the customer (use customers.State, not sales.State).
-- Q13. Show the top 10 customers by total spend from the sales table (name and amount).
-- Q14. Show the top 5 products by revenue with Product_Name and Brand.
-- Q15. Show Delivered orders where the customer is Platinum and the product is Electronics.
-- Q16. Show customers whose sales.State is different from customers.State.
-- Q17. Show orders where the Customer_Age in sales does not match Age in customers.
-- Q18. Use RIGHT JOIN to list all products and any matching sales. Rewrite the same query using LEFT JOIN.
-- Q19. Use FULL OUTER JOIN between customers and sales. How many unmatched rows are there on each side?
-- Q20. Show Category-wise count of Cancelled orders.
-- Q21. Show Brand-wise average rating given by customers in sales (Rating column).
-- Q22. Show customers who bought at least one Apple product.
-- Q23. Show customers who bought products from more than 3 different categories.
-- Q24. Show the total quantity sold for each Category and Payment_Mode combination.
-- Q25. Explain in one line each: INNER vs LEFT vs RIGHT vs FULL JOIN. When does LEFT JOIN give the same result as INNER JOIN?

-- ============================================================
-- DAY 09 - ADVANCED JOINS AND JOIN + AGGREGATES  (25 questions)
-- ============================================================
-- Q1. Self join: show pairs of customers living in the same City (do not repeat a pair twice).
-- Q2. Self join: show products of the same Brand with different Categories.
-- Q3. CROSS JOIN: create all combinations of Category and Payment_Mode.
-- Q4. Using a CROSS JOIN and LEFT JOIN, show every Category x Payment_Mode with revenue (0 if none).
-- Q5. Show customers who placed orders in both 2024 and 2025.
-- Q6. Show customers who ordered in 2024 but not in 2025.
-- Q7. Show each customer's first order date and last order date.
-- Q8. Show each customer's Total_Orders from customers and the actual order count from sales. List mismatches.
-- Q9. Show each customer's Total_Spent from customers and actual sum from sales. List customers where they differ.
-- Q10. Show average Selling_Price of products bought by each Customer_Tier.
-- Q11. Show the most sold Category in each State (use GROUP BY first, think about ranking later).
-- Q12. Show Category-wise revenue as a percentage of total revenue.
-- Q13. Show customers whose total spend is higher than the average spend of all customers.
-- Q14. Show the month-wise revenue for each Category in 2025.
-- Q15. Show products with Selling_Price higher than the average price of their own Category (join with a grouped result).
-- Q16. Show State-wise Delivered vs Returned order counts with the return percentage.
-- Q17. Show customers who used all 3 coupon codes at least once.
-- Q18. Show customers who have only ever used UPI.
-- Q19. Show products that were bought by only one customer.
-- Q20. Show the average number of days between order date and delivery date per Category.
-- Q21. Show the 3 most recent orders for the customer with Customer_ID of your choice, with product names.
-- Q22. Show Customer_Name, Total_Orders and the Brand they bought most often.
-- Q23. Show cities where more than 100 different customers placed orders.
-- Q24. Show products whose Avg_Rating in products is higher than the average Rating given in sales for that product.
-- Q25. Write a query to find the total revenue lost due to Cancelled and Returned orders per Category.

-- ============================================================
-- DAY 10 - SUBQUERIES  (25 questions)
-- ============================================================
-- Q1. Scalar subquery: show products priced above the average Selling_Price.
-- Q2. Show customers older than the average age.
-- Q3. Show orders with Total_Amount above the average order amount.
-- Q4. Show the product with the maximum Selling_Price using a subquery (no TOP).
-- Q5. Use IN: show customers who have placed at least one Cancelled order.
-- Q6. Use NOT IN: show customers who have never placed an order. What problem can NOT IN face with NULLs?
-- Q7. Use EXISTS: show customers who have at least one Delivered order.
-- Q8. Use NOT EXISTS: show products that were never sold.
-- Q9. Rewrite Q5 using EXISTS and using JOIN. Which is cleaner?
-- Q10. Correlated subquery: show products priced above the average price of their own Category.
-- Q11. Correlated subquery: show each customer's latest order (by Order_Date).
-- Q12. Correlated subquery: show orders whose Total_Amount is the highest for that customer.
-- Q13. Derived table: show Category and its average price, then filter only categories above 5000 in the outer query.
-- Q14. Derived table: find the average of the per-customer total spend.
-- Q15. Subquery in SELECT: show Customer_Name and a column with their order count.
-- Q16. Subquery in FROM with join: show State and the number of customers, along with the number of customers who ordered.
-- Q17. Show products whose Selling_Price is higher than ALL Beauty products (use ALL).
-- Q18. Show products whose price is higher than ANY Grocery product (use ANY).
-- Q19. Show the second highest Selling_Price using a subquery.
-- Q20. Show customers who spent more than the average spend of their own State.
-- Q21. Show orders placed on the date that had the highest number of orders.
-- Q22. Show customers who bought every product category (hint: compare distinct count with total categories).
-- Q23. Show Brands whose average rating is above the overall average rating.
-- Q24. Show the top 3 customers by spend per State without window functions (use correlated subquery or TOP in APPLY).
-- Q25. Explain the difference between a correlated and a non-correlated subquery, and between a subquery and a CTE.

-- ============================================================
-- DAY 11 - SET OPERATIONS AND CTEs  (25 questions)
-- ============================================================
-- Q1. Use UNION to list all unique cities from customers and sales together.
-- Q2. Use UNION ALL for the same and compare the row counts.
-- Q3. Use INTERSECT to find Customer_IDs that exist in both customers and sales.
-- Q4. Use EXCEPT to find Customer_IDs in customers but not in sales.
-- Q5. Use EXCEPT to find Product_IDs in products but not in sales.
-- Q6. Use UNION to combine Gold customers and customers from Delhi without duplicates.
-- Q7. Use INTERSECT to find customers who ordered in 2024 and 2025.
-- Q8. Use EXCEPT to find customers who ordered in 2024 but not 2025.
-- Q9. List all rules for set operators (column count, data type, ORDER BY position).
-- Q10. Show UNION ALL of revenue by Category and a Grand Total row.
-- Q11. Write a simple CTE that returns Delivered orders, then select the count from it.
-- Q12. Write a CTE to find total spend per customer, then show customers above 100000.
-- Q13. Write two CTEs: one for customer totals, another for product totals, and show top 5 of each using UNION ALL.
-- Q14. Use a CTE to show Category-wise average price, then join back to products to show products above their Category average.
-- Q15. Use a CTE to calculate monthly revenue, then show months above the average monthly revenue.
-- Q16. Use a CTE to find customers with more than 10 orders, then join to customers to show their names and State.
-- Q17. Use chained CTEs: orders per customer, then average of that.
-- Q18. Use a CTE to show the top 3 States by revenue and their cancel percentage.
-- Q19. Use a CTE to find the highest revenue month in each year.
-- Q20. Use a CTE to create a date list for every day of January 2025 (recursive CTE basics).
-- Q21. Using the date list from Q20, show orders per day including days with 0 orders.
-- Q22. Use a CTE to find products that sold more than the average quantity.
-- Q23. Use a CTE to compute return percentage per Brand and show brands above 15 percent.
-- Q24. Show customers who spent more than 50000 in total AND placed at least 5 orders using one CTE.
-- Q25. Explain: CTE vs temp table vs table variable vs view. When would you use each?

-- ============================================================
-- DAY 12 - DML: INSERT, UPDATE, DELETE, MERGE, TEMP TABLES  (25 questions)
-- ============================================================
-- Q1. Create a copy of customers named customers_copy using SELECT INTO.
-- Q2. Create an empty copy of products (structure only) named products_empty.
-- Q3. Insert one new row into customers_copy with all columns.
-- Q4. Insert 3 rows in one INSERT statement.
-- Q5. Insert rows from customers into customers_copy using INSERT ... SELECT (only Delhi customers).
-- Q6. Insert into a table using only some columns and let the others take NULL.
-- Q7. Update the Customer_Tier of a single customer.
-- Q8. Update the Age of all customers of Punjab by adding 1.
-- Q9. Update with CASE: set Customer_Tier to Platinum if Total_Spent > 200000, Gold if > 100000, else Silver.
-- Q10. Update using a JOIN (update customers_copy Total_Spent from the sales totals).
-- Q11. Update with a WHERE EXISTS condition.
-- Q12. Delete one specific customer from customers_copy.
-- Q13. Delete all customers from customers_copy with Total_Orders = 0.
-- Q14. Delete using a JOIN (delete products from a copy that never sold).
-- Q15. What is the difference between DELETE, TRUNCATE and DROP? Show each on a copy table.
-- Q16. Use OUTPUT with DELETE to see which rows were removed.
-- Q17. Use OUTPUT with UPDATE to see old and new values (inserted and deleted tables).
-- Q18. Use MERGE to update existing customers and insert new customers from another table.
-- Q19. Use MERGE with WHEN NOT MATCHED BY SOURCE to delete rows missing in the source.
-- Q20. Create a local temp table #top_customers with the top 100 customers by spend.
-- Q21. Create a global temp table ##temp_orders. How is it different from a local one?
-- Q22. Create a table variable @cust and insert 5 rows into it.
-- Q23. Use a temp table to store intermediate results and then join it with products.
-- Q24. Use BEGIN TRAN, an UPDATE, then ROLLBACK. Show the data is unchanged.
-- Q25. Use BEGIN TRAN, an UPDATE, then COMMIT. Explain what changed.

-- ============================================================
-- DAY 13 - DDL AND CONSTRAINTS  (25 questions)
-- ============================================================
-- Q1. Create a table employees with EmpID, Name, Salary, JoinDate, DeptID.
-- Q2. Add a PRIMARY KEY on EmpID.
-- Q3. Make EmpID an IDENTITY(1,1) column in a new table.
-- Q4. Add a NOT NULL constraint to Name.
-- Q5. Add a UNIQUE constraint to an Email column.
-- Q6. Add a CHECK constraint so Salary must be greater than 0.
-- Q7. Add a DEFAULT constraint so JoinDate defaults to today's date.
-- Q8. Create a departments table and add a FOREIGN KEY from employees.DeptID to departments.DeptID.
-- Q9. Try inserting a row that breaks the foreign key. What error do you get?
-- Q10. Use ON DELETE CASCADE in a foreign key and test it.
-- Q11. Use ALTER TABLE to add a new column Bonus.
-- Q12. Use ALTER TABLE to change the data type of a column.
-- Q13. Use ALTER TABLE to drop a column.
-- Q14. Rename a column and rename a table using sp_rename.
-- Q15. Add a computed column (for example Salary x 12 as Annual_Salary).
-- Q16. Show all constraints of a table using system views.
-- Q17. Drop a constraint and add it again.
-- Q18. Create a composite primary key on two columns.
-- Q19. Use SET IDENTITY_INSERT to insert a specific ID value.
-- Q20. Reset an identity value using DBCC CHECKIDENT.
-- Q21. Use SCOPE_IDENTITY() after an insert. How is it different from @@IDENTITY?
-- Q22. Explain the data types: INT vs BIGINT, VARCHAR vs NVARCHAR, DECIMAL vs FLOAT, DATE vs DATETIME vs DATETIME2.
-- Q23. Explain 1NF, 2NF and 3NF with a small example each.
-- Q24. What is the difference between a PRIMARY KEY and a UNIQUE key? Can a table have multiple of each?
-- Q25. What is the difference between a clustered and a non-clustered primary key?

-- ============================================================
-- DAY 14 - VIEWS AND INTERMEDIATE REVISION  (25 questions)
-- ============================================================
-- Q1. Create a view vw_delivered_orders for Delivered orders only.
-- Q2. Create a view with customer name, product name, and total amount (join of 3 tables).
-- Q3. Create a view showing revenue per Category.
-- Q4. Select from a view and filter on it.
-- Q5. Alter a view to add one more column.
-- Q6. Drop a view safely using IF EXISTS.
-- Q7. Can you INSERT or UPDATE through a view? Show an example and its limits.
-- Q8. What is WITH CHECK OPTION in a view? Show an example.
-- Q9. What is a schema-bound view? Why would you use it?
-- Q10. What is an indexed view and when is it useful?
-- Q11. Revision: show the top 5 customers by revenue with their State and Tier.
-- Q12. Revision: show the month-wise revenue and the previous month difference (using self join).
-- Q13. Revision: show the return percentage per Category and rank them.
-- Q14. Revision: show customers who ordered only one product category.
-- Q15. Revision: show the first and last purchased product of each customer.
-- Q16. Revision: find the repeat customers (ordered more than once) and their repeat rate.
-- Q17. Revision: show products whose revenue contributes to the top 80 percent of the total revenue.
-- Q18. Revision: show customers whose last order was Cancelled.
-- Q19. Revision: show State-wise revenue and the share of each State in total revenue.
-- Q20. Revision: show the average order value for each age group and tier combination.
-- Q21. Revision: find orders where Total_Amount = Order_Value + Shipping_Cost - Coupon_Discount does NOT hold.
-- Q22. Revision: find customers who have a Review_Text but no Rating.
-- Q23. Revision: show the most used Payment_Mode in each State.
-- Q24. Revision: find the busiest hour for orders in each State.
-- Q25. Revision: write one query that gives a one-page business summary: total orders, total revenue, unique customers, average order value, return percentage and cancel percentage.

-- SQL SERVER INTERVIEW PRACTICE - WEEK 3 (ADVANCED) QUESTIONS
-- Tables: customers, products, sales
-- Note: Days 15 to 18 need window functions. Day 19 and 20 are about performance and programming. Day 21 is a mock interview, so try it without hints and with a timer.

-- ============================================================
-- DAY 15 - WINDOW FUNCTIONS: RANKING  (25 questions)
-- ============================================================
-- Q1. Add a ROW_NUMBER() over all products ordered by Selling_Price desc.
-- Q2. Rank products by Selling_Price with RANK() and compare with DENSE_RANK() on ties.
-- Q3. Rank customers by Total_Spent inside each State (PARTITION BY).
-- Q4. Show the top 3 customers by Total_Spent in each State.
-- Q5. Show the top 3 products by Avg_Rating in each Category (use Total_Reviews to break ties).
-- Q6. Show the most expensive product in each Category.
-- Q7. Show the cheapest product in each Brand.
-- Q8. Show the latest order of each customer using ROW_NUMBER().
-- Q9. Show the first order of each customer using ROW_NUMBER().
-- Q10. Show the second order of each customer.
-- Q11. Divide customers into 4 equal groups by Total_Spent using NTILE(4).
-- Q12. Show the top 10 percent customers by spend using NTILE(10) or PERCENT_RANK().
-- Q13. Use PERCENT_RANK() to show the percentile of each product by Selling_Price.
-- Q14. Use CUME_DIST() on Age and explain the output.
-- Q15. Rank States by revenue, then show the top 3 States.
-- Q16. Rank Brands by revenue inside each Category and show the top 2.
-- Q17. Show the top 3 best selling products by quantity in each Category.
-- Q18. Show the top 5 orders by Total_Amount in each Payment_Mode.
-- Q19. Rank customers by number of orders, and show customers ranked 1 to 5 (watch for ties).
-- Q20. What is the difference between ROW_NUMBER, RANK, DENSE_RANK and NTILE? Show one table with sample output for each.
-- Q21. Show products and their rank by price within the Category and within the whole table in one query.
-- Q22. Use a CTE with DENSE_RANK to find the 3rd highest Selling_Price per Category.
-- Q23. Show customers whose spend rank in their State is the same as their spend rank in their Age_Group.
-- Q24. Why can't you use a window function in a WHERE clause? How do you work around it?
-- Q25. Show the number of customers in each NTILE group with minimum and maximum spend.

-- ============================================================
-- DAY 16 - WINDOW FUNCTIONS: AGGREGATES, LAG, LEAD, RUNNING TOTALS  (25 questions)
-- ============================================================
-- Q1. Show each order with the total revenue of its customer using SUM() OVER (PARTITION BY).
-- Q2. Show each product with the average price of its Category in a new column.
-- Q3. Show each product and its difference from the Category average price.
-- Q4. Show each order and its percentage of the customer's total spend.
-- Q5. Show a running total of revenue by Order_Date.
-- Q6. Show a running total of revenue per customer by Order_Date.
-- Q7. Show monthly revenue with the previous month revenue using LAG().
-- Q8. Show monthly revenue with the next month revenue using LEAD().
-- Q9. Show month-over-month growth percentage.
-- Q10. Show year-over-year growth for each month.
-- Q11. Show for each customer the number of days since their previous order (LAG + DATEDIFF).
-- Q12. Show customers whose gap between two orders was more than 90 days.
-- Q13. Show a 3 month moving average of revenue (ROWS BETWEEN 2 PRECEDING AND CURRENT ROW).
-- Q14. Show a 7 day moving average of daily revenue.
-- Q15. Use FIRST_VALUE to show the first product bought by each customer.
-- Q16. Use LAST_VALUE to show the last product bought by each customer (watch the frame clause).
-- Q17. Show the cumulative percentage of revenue by product (a Pareto / 80-20 analysis).
-- Q18. Show the running count of orders per State by month.
-- Q19. Show the highest and lowest Total_Amount for each customer next to each order.
-- Q20. Show each order's Total_Amount vs the previous order's Total_Amount of the same customer.
-- Q21. Show customers whose spend increased in every consecutive order (hint: LAG and compare).
-- Q22. Show the share of each Payment_Mode in total orders per State.
-- Q23. What is the difference between ROWS and RANGE in the window frame? Show an example with ties.
-- Q24. What is the default frame when ORDER BY is used in a window? Why does it matter for LAST_VALUE?
-- Q25. Show the best month of each year and its difference from the average month of that year.

-- ============================================================
-- DAY 17 - ADVANCED CTEs, PIVOT, ROLLUP AND CUBE  (25 questions)
-- ============================================================
-- Q1. Recursive CTE: generate numbers 1 to 100.
-- Q2. Recursive CTE: generate every date from 2025-01-01 to 2025-12-31.
-- Q3. Use the date series to find days with no orders in 2025.
-- Q4. Recursive CTE: build an employee hierarchy (create a small manager-employee table first) and show each level.
-- Q5. Recursive CTE: show the full path (Manager > Team Lead > Employee) for each employee.
-- Q6. Use MAXRECURSION and explain why it exists.
-- Q7. PIVOT: show revenue by Category as rows and Payment_Mode as columns.
-- Q8. PIVOT: show monthly orders as columns (Jan to Dec) for 2025.
-- Q9. PIVOT: show Order_Status counts as columns for each State.
-- Q10. Do the same as Q7 using CASE (conditional aggregation). Which is easier to maintain?
-- Q11. UNPIVOT: convert the pivot of Q7 back to rows.
-- Q12. Use GROUP BY ROLLUP to get revenue by Category, Brand with subtotals and grand total.
-- Q13. Use GROUP BY CUBE for Category and Payment_Mode.
-- Q14. Use GROUPING SETS for (State), (Payment_Mode) and () in one query.
-- Q15. Use GROUPING() to label subtotal rows as 'All'.
-- Q16. Use GROUPING_ID to separate the different subtotal levels.
-- Q17. Use CROSS APPLY to get the top 3 orders for each customer.
-- Q18. Use OUTER APPLY and explain the difference from CROSS APPLY.
-- Q19. Use STRING_SPLIT to split 'Delhi,Gujarat,Punjab' and filter customers.
-- Q20. Use STRING_AGG to show all distinct payment modes used by each customer.
-- Q21. Use FOR XML PATH to do the same as Q20 (older SQL Server versions).
-- Q22. Use CHOOSE, IIF and a nested CASE to create three different versions of the same label.
-- Q23. Use TRY_CONVERT and TRY_CAST to clean a dirty column. Make a small example table first.
-- Q24. Use OPENJSON or JSON_VALUE to read a small JSON text.
-- Q25. Use FOR JSON PATH to output the top 5 customers as JSON.

-- ============================================================
-- DAY 18 - CLASSIC INTERVIEW QUESTIONS  (25 questions)
-- ============================================================
-- Q1. Find the 2nd highest Selling_Price (3 ways: subquery, TOP, DENSE_RANK).
-- Q2. Find the Nth highest Selling_Price (change N easily).
-- Q3. Find the Nth highest spender in each State.
-- Q4. Find duplicate emails in customers.
-- Q5. Find duplicate rows based on several columns (Customer_Name + Phone).
-- Q6. Delete duplicates but keep one copy (use ROW_NUMBER inside a CTE on a copy table).
-- Q7. Find customers who have the same name but different cities.
-- Q8. Find rows with NULL in any column.
-- Q9. Find consecutive order days for a customer (gaps and islands, step 1: find the pattern).
-- Q10. Find the longest streak of consecutive order days for any customer.
-- Q11. Find missing dates in the sales table (dates with no orders).
-- Q12. Find the top 3 products per Category by revenue.
-- Q13. Find customers who bought a product and returned it later (by status Returned).
-- Q14. Find products that are always bought together (two products in the same order cannot happen here, so find products bought by the same customer on the same day).
-- Q15. Find the percentage of customers who ordered more than once.
-- Q16. Find monthly retention: customers who ordered in one month and again in the next month.
-- Q17. Find new vs repeat customers by month.
-- Q18. Find customers who haven't ordered in the last 90 days (relative to the latest date in the table).
-- Q19. Find the median Selling_Price (PERCENTILE_CONT and without it).
-- Q20. Find the mode (most frequent) Payment_Mode per State.
-- Q21. Find employees earning more than their manager (create the small tables yourself).
-- Q22. Swap the values of two columns using a single UPDATE.
-- Q23. Find the running total that resets each month.
-- Q24. Find the customers who are in the top 10 percent for both spend and order count.
-- Q25. Find the difference between two consecutive rows in a column, for a column of your choice, without LAG (self join).

-- ============================================================
-- DAY 19 - INDEXES, PERFORMANCE AND TRANSACTIONS  (25 questions)
-- ============================================================
-- Q1. Create a clustered index on a table that has none (use a copy).
-- Q2. Create a non-clustered index on customers(State).
-- Q3. Create a composite index on sales(Customer_ID, Order_Date). Explain column order.
-- Q4. Create a covering index with INCLUDE columns.
-- Q5. Create a filtered index (for example only Cancelled orders).
-- Q6. Create a unique index and test a duplicate insert.
-- Q7. Show all indexes of a table using sys.indexes.
-- Q8. Turn on SET STATISTICS IO and TIME and compare a query before and after an index.
-- Q9. Read an execution plan: identify a Table Scan, Index Scan and Index Seek.
-- Q10. What is a key lookup (RID lookup)? How do you remove it?
-- Q11. Why does WHERE YEAR(Order_Date) = 2025 stop an index from being used? Rewrite it so it can.
-- Q12. Why does WHERE Name LIKE '%abc' stop an index seek? What about 'abc%'?
-- Q13. What is SARGability? Give three examples of non-SARGable conditions and fix them.
-- Q14. Explain implicit conversion and how it hurts performance.
-- Q15. Compare SELECT * vs selecting needed columns in terms of performance.
-- Q16. Compare EXISTS vs IN vs JOIN for performance on large tables.
-- Q17. Compare UNION vs UNION ALL for performance.
-- Q18. Explain index fragmentation. How do you REBUILD vs REORGANIZE?
-- Q19. Explain statistics in SQL Server and what UPDATE STATISTICS does.
-- Q20. What is parameter sniffing? How can you fix it?
-- Q21. Explain ACID with a bank transfer example. Write the transfer using BEGIN TRAN / COMMIT / ROLLBACK.
-- Q22. Use TRY...CATCH with ROLLBACK and show the error using ERROR_MESSAGE().
-- Q23. Explain the isolation levels: READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, SERIALIZABLE, SNAPSHOT.
-- Q24. Explain dirty read, non-repeatable read and phantom read with one example each.
-- Q25. What is a deadlock? Show how to reproduce one with two sessions and how to avoid it.

-- ============================================================
-- DAY 20 - STORED PROCEDURES, FUNCTIONS, TRIGGERS, DYNAMIC SQL  (25 questions)
-- ============================================================
-- Q1. Create a stored procedure that returns all customers.
-- Q2. Create a stored procedure with one input parameter (State) that returns customers from that state.
-- Q3. Create a stored procedure with a default parameter value.
-- Q4. Create a stored procedure with an OUTPUT parameter that returns the total revenue of a customer.
-- Q5. Create a stored procedure that returns the top N products by revenue (N as a parameter).
-- Q6. Create a stored procedure that takes a start date and end date and returns revenue by Category.
-- Q7. Add TRY...CATCH and a transaction inside a stored procedure that inserts an order and updates stock.
-- Q8. Create a stored procedure that uses IF...ELSE to return different results.
-- Q9. Use WHILE loop to print numbers 1 to 10.
-- Q10. Create a scalar function that returns the tier label for a given Total_Spent.
-- Q11. Create an inline table-valued function that returns orders of a customer.
-- Q12. Create a multi-statement table-valued function and compare it with an inline one for performance.
-- Q13. Use a function inside a SELECT on customers and explain why it can slow down a large query.
-- Q14. Difference between a stored procedure and a function (5 points).
-- Q15. Create an AFTER INSERT trigger that logs new rows into an audit table.
-- Q16. Create an AFTER UPDATE trigger that stores the old and new values using the inserted and deleted tables.
-- Q17. Create an INSTEAD OF DELETE trigger that marks a row inactive instead of deleting it.
-- Q18. What are triggers' disadvantages? When would you avoid them?
-- Q19. Write dynamic SQL with EXEC and sp_executesql that takes a table name and returns its row count.
-- Q20. How do you prevent SQL injection in dynamic SQL?
-- Q21. Use a cursor to loop through the top 10 customers and print their names. Then rewrite it without a cursor.
-- Q22. Why are cursors usually discouraged? Name two situations where they are still fine.
-- Q23. Use @@ROWCOUNT, @@ERROR and RAISERROR / THROW in a small script.
-- Q24. Use SELECT INTO vs INSERT INTO ... SELECT. Explain the differences.
-- Q25. What is the difference between temp tables, table variables and CTEs in terms of scope, statistics, and indexes?

-- ============================================================
-- DAY 21 - MOCK INTERVIEW: BUSINESS PROBLEMS AND THEORY  (30 questions)
-- ============================================================
-- Q1. Find the top 5 customers by revenue and show their share in total revenue.
-- Q2. Find the Category with the highest return rate.
-- Q3. Find the month with the highest revenue in each year and the growth over the previous month.
-- Q4. Find the States where cancel percentage is above the overall cancel percentage.
-- Q5. Find customers who ordered at least once every quarter of 2025.
-- Q6. Find products that are in the top 3 by revenue in at least 2 States.
-- Q7. Find the average time between a customer's first and second order.
-- Q8. Find the customers whose average order value is above the overall average and who have more than 5 orders.
-- Q9. Find the coupon code that gave the most revenue per discount rupee.
-- Q10. Find the Payment_Mode with the highest Delivered percentage.
-- Q11. Find the age group with the highest average order value in each Category.
-- Q12. Find the day of the week with the most orders and the lowest orders.
-- Q13. Find the brands that lost revenue in 2026 compared to 2025.
-- Q14. Find customers who bought only discounted products (Discount_Percent > 0 every time).
-- Q15. Find the cumulative revenue contribution of the top 20 percent of products.
-- Q16. Create a customer segmentation: High (top 20 percent spend), Medium (next 30 percent) and Low (rest). Show counts.
-- Q17. Build an RFM table: Recency (days since last order), Frequency (order count), Monetary (total spend) for each customer.
-- Q18. Score each RFM value from 1 to 5 using NTILE and combine into a segment.
-- Q19. Show customers who ordered, got a Returned status, and ordered again within 30 days.
-- Q20. Create a daily revenue table with 7 day moving average and flag days below the average.
-- Q21. Optimize a slow query: take any query from Day 9 and rewrite it to run faster. Explain what you changed.
-- Q22. Theory: Explain the order of execution of a SQL query (FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY).
-- Q23. Theory: WHERE vs HAVING.
-- Q24. Theory: DELETE vs TRUNCATE vs DROP.
-- Q25. Theory: UNION vs UNION ALL vs INTERSECT vs EXCEPT.
-- Q26. Theory: Clustered vs non-clustered index.
-- Q27. Theory: Primary key vs foreign key vs unique key.
-- Q28. Theory: CTE vs subquery vs temp table vs view.
-- Q29. Theory: What is normalization and denormalization, and when would you denormalize?
-- Q30. Theory: Explain how you would approach a slow report query step by step in an interview.

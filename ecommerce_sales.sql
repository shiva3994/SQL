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



-- Q7. Show customers older than 60.
-- Q8. Show customers aged 25 or younger.
-- Q9. Show Electronics products of the brand Apple.
-- Q10. Show customers who live in Delhi OR Karnataka.
-- Q11. Show customers whose tier is NOT Silver (use <>).
-- Q12. Show Customer_Name as Name and Total_Spent as Spend (use aliases).
-- Q13. Show Product_Name and a new column Stock_Value = Selling_Price x Stock_Quantity.
-- Q14. Show Delivered orders with Total_Amount above 50000.
-- Q15. Show orders paid by COD that were Returned.
-- Q16. Show products with Discount_Percent greater than 40.
-- Q17. Show products with Selling_Price below 500.
-- Q18. Show customers registered after 2024-01-01.
-- Q19. Show all orders placed from Chennai.
-- Q20. Show customers who have never ordered (Total_Orders = 0).
-- Q21. Show products rated 4.5 or higher.
-- Q22. Show orders with Quantity = 3 where a coupon discount was given (Coupon_Discount > 0).
-- Q23. Show all products that are NOT in the Electronics category.
-- Q24. Show customers from Maharashtra who spent more than 100000.
-- Q25. Show Customer_Name, Age, Customer_Tier of female Platinum customers older than 40.

-- ============================================================
-- DAY 02 - Filtering Operators  (25 questions)
-- Topics: IN, NOT IN, BETWEEN, LIKE, IS NULL, AND/OR precedence
-- ============================================================
-- Q1. Show customers from Delhi, Gujarat or Rajasthan using IN.
-- Q2. Show customers NOT from Delhi, Gujarat or Rajasthan using NOT IN.
-- Q3. Show customers aged between 30 and 40 (both included).
-- Q4. Show orders placed in January 2025 using BETWEEN on Order_Date.
-- Q5. Show customers whose name starts with 'A'.
-- Q6. Show customers whose name ends with 'Kumar'.
-- Q7. Show customers whose email contains 'sharma'.
-- Q8. Show cities whose SECOND letter is 'u' (use _).
-- Q9. Show customers whose phone starts with +91-98.
-- Q10. Show customers having a Gmail address (email ends with @gmail.com).
-- Q11. Show orders where no coupon was used (Coupon_Code is NULL).
-- Q12. Show orders that have a rating (Rating is NOT NULL).
-- Q13. Show orders with Rating 4 or above (NULLs will not appear automatically).
-- Q14. Show Gold customers who live in Delhi OR Punjab. Use brackets correctly.
-- Q15. Show Fashion products of brand Nike or Puma.
-- Q16. Show products priced between 1000 and 5000 with a discount of 10, 20 or 30 percent.
-- Q17. Show customers whose name contains 'Singh' anywhere.
-- Q18. Show customers whose name does NOT contain 'Kumar' (NOT LIKE).
-- Q19. Show customers with pincode between 110000 and 110099.
-- Q20. Show customers whose name starts with A, B or C using [ ].
-- Q21. Show customers whose name does NOT start with a vowel ([^ ]).
-- Q22. Show customers registered in September 2023 using >= and < (no BETWEEN).
-- Q23. Show Cancelled or Returned orders that were NOT paid by COD.
-- Q24. Show Gold or Platinum customers who have 5 to 10 orders.
-- Q25. Show brands that have exactly 4 letters and start with 'N' (_ for one character).

-- ============================================================
-- DAY 03 - Sorting, TOP, DISTINCT and Paging  (26 questions)
-- Topics: ORDER BY, TOP, TOP WITH TIES, DISTINCT, OFFSET-FETCH
-- ============================================================
-- Q1. Show all customers sorted by Customer_Name A to Z.
-- Q2. Show all products sorted by Selling_Price, highest first.
-- Q3. Show the 10 most expensive products (by Selling_Price).
-- Q4. Show the 5 youngest customers.
-- Q5. Sort customers by State A to Z, then by Total_Spent highest first inside each state.
-- Q6. Show the list of unique states in customers.
-- Q7. Show the unique Payment_Mode values in sales.
-- Q8. Show unique combinations of State and City from customers.
-- Q9. Count how many different cities exist in customers.
-- Q10. Show the 10 highest Total_Amount orders that are Delivered.
-- Q11. Show the top 5 products by Avg_Rating using TOP 5 WITH TIES.
-- Q12. Show the top 1 PERCENT of customers by Total_Spent.
-- Q13. Using OFFSET ... FETCH, skip the first 10 customers and show the next 10 (order by Customer_ID).
-- Q14. Page 3 of products with 25 rows per page (order by Product_ID).
-- Q15. Show the 5 products with the highest stock value (Selling_Price x Stock_Quantity), sorting by the expression.
-- Q16. Show Customer_Name, Age sorted by the 2nd column (column position) highest first.
-- Q17. Show the 10 latest orders using Order_Date then Order_Time (both newest first).
-- Q18. Find the cheapest product in the Grocery category.
-- Q19. Show the 10 best rated products that have at least 100 reviews.
-- Q20. Count how many different customers have placed at least one order (use sales).
-- Q21. Show unique non-NULL coupon codes used in sales.
-- Q22. Sort customers in this custom order: Platinum, Gold, Silver (use CASE inside ORDER BY).
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


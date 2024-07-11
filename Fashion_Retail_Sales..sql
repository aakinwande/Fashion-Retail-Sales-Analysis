SELECT * FROM retail_sales.fashion_retail_sales;

-- 1.Top Selling Products
-- Top 10 best-selling products by quantity
SELECT Item_Purchased, 
		COUNT(*) AS Total_Sales 
FROM retail_sales.fashion_retail_sales
GROUP BY Item_Purchased
ORDER BY Total_Sales DESC
LIMIT 10;

-- 2. Customer Segmentation
-- Customer segmentation by average purchase amount
SELECT Customer_Reference_ID,
       AVG(Purchase_Amount) AS Avg_Purchase_Amount,
       CASE
           WHEN AVG(Purchase_Amount) >= 1000 THEN 'High Value'
           WHEN AVG(Purchase_Amount) >= 500 AND AVG(Purchase_Amount) < 1000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS Customer_Segment
FROM retail_sales.fashion_retail_sales
GROUP BY Customer_Reference_ID
ORDER BY Avg_Purchase_Amount DESC;


-- 3. Peak Sales Periods
-- Peak sales months
SELECT 
    COUNT(*) AS Total_Sales,
    DATE_FORMAT(STR_TO_DATE(Date_Purchase, '%d/%m/%Y'), '%M') AS Purchase_Month
FROM 
    retail_sales.fashion_retail_sales
GROUP BY Purchase_Month 
ORDER BY Total_Sales DESC;


-- 4. Average Transaction Value
-- Average transaction value
SELECT AVG(Purchase_Amount) AS Avg_Transaction_Value
FROM retail_sales.fashion_retail_sales;


-- 5. Customer Satisfaction Levels
-- Average review rating
SELECT ROUND(AVG(Review_Rating), 2) AS Avg_Review_Rating
FROM retail_sales.fashion_retail_sales;


-- 6. Preferred Payment Methods
-- Payment method preferences
SELECT Payment_Method,
       COUNT(*) AS Payment_Count,
       SUM(Purchase_Amount) AS Total_Purchase_Amount
FROM retail_sales.fashion_retail_sales
GROUP BY Payment_Method;


-- 7. Product Performance by Rating
-- Top 10 Products with the highest average review ratings
SELECT Item_Purchased, ROUND(AVG(Review_Rating), 2) AS Avg_Ratings FROM retail_sales.fashion_retail_sales
GROUP BY Item_Purchased
ORDER BY Avg_Ratings DESC
LIMIT 10;


-- 8. Seasonal Trends
-- Sales by season
SELECT CASE
           WHEN MONTH(STR_TO_DATE(Date_Purchase, '%d/%m/%Y')) IN (12, 1, 2) THEN 'Winter'
           WHEN MONTH(STR_TO_DATE(Date_Purchase, '%d/%m/%Y')) IN (3, 4, 5) THEN 'Spring'
           WHEN MONTH(STR_TO_DATE(Date_Purchase, '%d/%m/%Y')) IN (6, 7, 8) THEN 'Summer'
           ELSE 'Fall'
       END AS Season,
       COUNT(*) AS Total_Sales,
       SUM(Purchase_Amount) AS Total_Sales_Amount
FROM retail_sales.fashion_retail_sales
GROUP BY Season
ORDER BY Total_Sales_Amount DESC;

-- 9. Average Purchase per Payment Method
-- Average purchase amount per payment method
SELECT Payment_Method, AVG(Purchase_Amount) AS Avg_Purchase_Amount
FROM retail_sales.fashion_retail_sales
GROUP BY Payment_Method
ORDER BY Avg_Purchase_Amount DESC;




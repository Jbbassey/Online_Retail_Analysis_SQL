-- Customers frequency of purchase

 WITH customer_orders AS (
    SELECT 
        Order_ID, Order_Date, Customer_Name
	FROM Orders
	JOIN Details 
	ON orders.Order_ID = Details.Order_ID
)
SELECT 
    Customer_Name,
    TO_CHAR(Order_Date, 'Month') AS "month_orders_were_made", 
    COUNT(Order_ID) AS "Total_orders_made",
    SUM(COUNT(Order_ID)) OVER (PARTITION BY TO_CHAR(Order_Date, 'Month')) AS total_monthly_orders
FROM customer_orders
GROUP BY 
    TO_CHAR(Order_Date, 'Month'), 
    Customer_Name, Order_Date
ORDER BY 
    Customer_Name,
    Extract(month from Order_Date)
LIMIT 25;

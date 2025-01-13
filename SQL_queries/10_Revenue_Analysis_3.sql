-- Average quantity ordered and profit made from each customer

 WITH customer_orders AS (
    SELECT 
        Customer_Name, Category,
        Quantity, Profit 
	FROM Orders
	JOIN Details 
	ON orders.Order_ID = Details.Order_ID
)
SELECT
    Customer_Name, Category, 
    ROUND(AVG(Quantity), 0) as Average_quantity_purchased, 
    Profit as profit_made
FROM customer_orders
GROUP BY Category, Customer_Name, Profit
ORDER BY Category, Average_quantity_purchased desc
LIMIT 25;
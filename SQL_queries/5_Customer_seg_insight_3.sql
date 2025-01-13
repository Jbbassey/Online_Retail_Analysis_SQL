-- Average Quantity ordered by customers

 WITH customer_orders AS (
    SELECT 
        Customer_Name, Quantity
         
	FROM Orders
	JOIN Details 
	ON orders.Order_ID = Details.Order_ID
)
SELECT 
    DISTINCT(Customer_Name) as Customer_Name,  
	ROUND(AVG(Quantity), 1) as average_quantity_purchased
FROM customer_orders
GROUP BY Customer_Name
ORDER BY average_quantity_purchased desc
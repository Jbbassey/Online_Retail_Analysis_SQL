-- Most used Payment Mode

WITH customer_orders AS (
    SELECT 
        Order_ID, Payment_Mode
	FROM Orders
	JOIN Details 
	ON orders.Order_ID = Details.Order_ID
)
SELECT
    Payment_Mode, 
    count(Order_ID) as "Total times used for payment"  
FROM customer_orders
GROUP BY Payment_Mode
ORDER BY "Total times used for payment" desc
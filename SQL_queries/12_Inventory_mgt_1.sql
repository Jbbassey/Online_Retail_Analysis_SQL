--Total sub_category product orders made with quantity orderd
WITH customer_orders AS (
    SELECT 
        Order_ID, Sub_Category,
        Quantity
	FROM Orders
	JOIN Details 
	ON Orders.Order_ID = Details.Order_ID
)
SELECT 
    Sub_Category, COUNT(Order_ID) as total_orders, 
    SUM(Quantity) as total_quantity_orderd
FROM customer_orders
GROUP BY Sub_Category
ORDER BY total_orders desc
--Average Quantity of products Ordered(Category)

WITH customer_orders AS (
    SELECT 
        Order_ID, Order_Date, Customer_Name,
        State, City, Category, Sub_Category,
        Amount, Quantity, Payment Mode, Profit 
	FROM Orders
	JOIN Details 
	ON orders.Order_ID = Details.Order_ID
) 
SELECT 
    Category, 
    AVG(Quantity) as Average_Quantity_ordered
FROM customer_orders
GROUP BY Category
ORDER BY Average_Quantity_ordered desc
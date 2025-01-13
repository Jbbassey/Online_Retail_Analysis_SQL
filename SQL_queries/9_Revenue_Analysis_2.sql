-- Profit made from products(Sub_category)

 WITH customer_orders AS (
    SELECT 
        Sub_Category, Profit 
	FROM Orders
	JOIN Details 
	ON orders.Order_ID = Details.Order_ID
)
SELECT 
    Sub_Category, 
    SUM("Profit") as sum_Profit_made
FROM customer_orders
GROUP BY Sub_Category
ORDER BY total_Profit_made desc


-- Profit made from products(Category)

 WITH customer_orders AS (
    SELECT 
        Category, Profit 
	FROM Orders
	JOIN Details 
	ON orders.Order_ID = Details.Order_ID
)
SELECT 
   Category, 
    SUM(Profit) as total_Profit_made
FROM customer_orders
GROUP BY Category
ORDER BY total_Profit_made desc
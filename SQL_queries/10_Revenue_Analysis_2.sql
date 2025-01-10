-- Profit made from products(Sub_category)

WITH customer_orders AS (
    SELECT 
        orders."Order_ID", orders."Order_Date", 
		"CustomerName", orders."State", 
		orders."City", "Category",
		"Sub-Category", "Amount", "Quantity",
		"Payment Mode", "Profit"
	FROM "orders"
	JOIN "Details" 
	ON orders."Order_ID" = "Details"."Order_ID"
)
SELECT 
    "Sub-Category", 
    SUM("Profit") as sum_Profit_made
FROM customer_orders
GROUP BY "Sub-Category"
ORDER BY total_Profit_made desc


-- Profit made from products(Category)

WITH customer_orders AS (
    SELECT 
        orders."Order_ID", orders."Order_Date", 
		"CustomerName", orders."State", 
		orders."City", "Category",
		"Sub-Category", "Amount", "Quantity",
		"Payment Mode", "Profit"
	FROM "orders"
	JOIN "Details" 
	ON orders."Order_ID" = "Details"."Order_ID"
)
SELECT 
    "Category", 
    SUM("Profit") as total_Profit_made
FROM customer_orders
GROUP BY "Category"
ORDER BY total_Profit_made desc
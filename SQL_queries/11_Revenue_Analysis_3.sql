-- Average quantity ordered and profit made by customers

WITH customer_orders AS (
    SELECT
        orders."Order_ID", orders."Order_Date", 
        "CustomerName", orders."State", orders."City", 
        "Category", "Sub-Category", "Amount", 
        "Quantity", "Payment Mode", "Profit"
	FROM orders
	join "Details" 
	on orders."Order_ID" = "Details"."Order_ID"
)
SELECT
    "CustomerName", "Category", 
    ROUND(AVG("Quantity"), 0) as Average_quantity_purchased, 
    "Profit" as profit_made
FROM customer_orders
GROUP BY "Category", "CustomerName", "Profit"
ORDER BY "Category", Average_quantity_purchased desc
LIMIT 10;
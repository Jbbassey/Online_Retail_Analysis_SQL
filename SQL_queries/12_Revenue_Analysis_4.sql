-- states and revenue generated with product

WITH customer_orders AS (
    SELECT
        orders."Order_ID", "Order_Date", "State",
        "City", "Category", "Sub-Category", "Amount",
        "Quantity", "Payment Mode", "Profit" 
	FROM orders
	JOIN "Details" 
	ON orders."Order_ID" = "Details"."Order_ID"
)
SELECT 
    "State", "Category", 
    SUM("Quantity") * SUM("Amount") as Sum_revenue_generated
FROM customer_orders
GROUP BY "State", "Category"
ORDER BY "State", Sum_revenue_generated desc
LIMIT 12;
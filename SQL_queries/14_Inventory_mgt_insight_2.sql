-- TOTAL MONTHLY ORDERS  

WITH customer_orders AS (
    SELECT 
        orders."Order_ID", orders."Order_Date", "CustomerName", orders."State", orders."City", "Category",
		"Sub-Category", "Amount", "Quantity", "Payment Mode", "Profit" 
    FROM orders
    JOIN "Details" 
    ON orders."Order_ID" = "Details"."Order_ID"
),
customer_orders_2 as (SELECT 
    TO_CHAR("Order_Date", 'Month') AS month,
    "Category", 
    COUNT("Order_ID") AS total_orders,
    EXTRACT(MONTH FROM "Order_Date") AS month_number
FROM customer_orders
GROUP BY 
    TO_CHAR("Order_Date", 'Month'), 
    "Category", 
    EXTRACT(MONTH FROM "Order_Date")
ORDER BY month_number
)
select month, "Category", total_orders
from customer_orders_2
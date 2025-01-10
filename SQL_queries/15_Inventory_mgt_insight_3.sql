-- TOTAL ORDERS BY YEARLY QUARTER

WITH customer_orders AS (
    SELECT orders."Order_ID", orders."Order_Date",
        "CustomerName", orders."City",
        "Category", "Sub-Category", "Amount",
        "Quantity", "Payment Mode", "Profit"
    FROM orders
    JOIN "Details" 
    ON orders."Order_ID" = "Details"."Order_ID"
),
customer_orders_quarter AS (
    SELECT 
        "Category",
        EXTRACT(QUARTER FROM "Order_Date") AS year_quarter,
        COUNT("Order_ID") AS total_orders
    FROM customer_orders
    GROUP BY "Category", EXTRACT(QUARTER FROM "Order_Date")
),
final_totals AS (
    SELECT 
        CASE EXTRACT(QUARTER FROM "Order_Date")
            WHEN 1 THEN 'Qtr 1'
            WHEN 2 THEN 'Qtr 2'
            WHEN 3 THEN 'Qtr 3'
            WHEN 4 THEN 'Qtr 4'
        END AS year_quarter,
        "Category",
        COUNT("Order_ID") AS total_orders
    FROM customer_orders
    GROUP BY "Category", EXTRACT(QUARTER FROM "Order_Date")
)
SELECT 
    year_quarter, "Category",
    SUM(total_orders) AS total_orders
FROM final_totals
GROUP BY year_quarter, "Category"
ORDER BY year_quarter, total_orders DESC;
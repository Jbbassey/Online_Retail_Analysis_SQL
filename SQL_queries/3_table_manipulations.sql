--To check for missing values

WITH customer_orders AS (
    SELECT
        orders."Order_ID", orders."Order_Date", 
        orders."State", orders."City", 
        "Category", "Sub-Category", 
        "Amount", "Quantity", 
        "Payment Mode", "Profit"
    FROM "orders"
    JOIN "Details" 
    ON orders."Order_ID" = "Details"."Order_ID"
)
SELECT * 
FROM customer_orders
WHERE "Order_ID" IS NULL OR "Order_Date" IS NULL
   OR "State" IS NULL OR "City" IS NULL
   OR "Category" IS NULL OR "Sub-Category" IS NULL
   OR "Amount" IS NULL OR "Quantity" IS NULL 
   OR "Payment Mode" IS NULL OR "Profit" IS NULL;




--To check for duplicate values

WITH customer_orders AS (
    SELECT 
        orders."Order_ID", orders."Order_Date",
        orders."State", orders."City", "Category",
		"Sub-Category", "Amount", "Quantity",
        "Payment Mode", "Profit"
    FROM "orders"
    JOIN "Details" 
    ON orders."Order_ID" = "Details"."Order_ID"
)
SELECT *, 
       COUNT(*) AS duplicate_count
FROM customer_orders
GROUP BY "Order_ID", "Order_Date", 
         "State", "City", "Category", 
         "Sub-Category", "Amount", 
         "Quantity", "Payment Mode", 
         "Profit"
HAVING COUNT(*) > 1;
-- Total Quantity of products Ordered(Sub_category)

WITH customer_orders AS (
    SELECT 
        orders."Order_ID", "Order_Date", "State", 
        "City", "Category", "Sub-Category", "Amount",
        "Quantity", "Payment Mode", "Profit"
	FROM orders
	JOIN  "Details" 
	ON orders."Order_ID" = "Details"."Order_ID"
) 
SELECT 
    "Sub-Category", 
    sum("Quantity") as Total_Quantity_ordered
FROM customer_orders
GROUP BY "Sub-Category"
ORDER BY Total_Quantity_ordered desc



--Average Quantity of products Ordered(Category)

WITH customer_orders AS (
    SELECT 
        orders."Order_ID", "Order_Date", "State", 
        "City", "Category", "Sub-Category", "Amount",
        "Quantity", "Payment Mode", "Profit"
	FROM orders
	JOIN  "Details" 
	ON orders."Order_ID" = "Details"."Order_ID"
) 
SELECT 
    "Category", 
    AVG("Quantity") as Average_Quantity_ordered
FROM customer_orders
GROUP BY "Category"
ORDER BY Average_Quantity_ordered desc
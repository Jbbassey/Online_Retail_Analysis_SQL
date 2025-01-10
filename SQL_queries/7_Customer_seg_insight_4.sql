-- Most used Payment Mode

 WITH customer_orders AS (
    SELECT
        orders."Order_ID", orders."Order_Date", 
        "CustomerName", orders."State", 
        orders."City", "Category",
		"Sub-Category", "Amount", "Quantity", 
        "Payment Mode", "Profit"
	FROM orders
	JOIN  "Details" 
	ON orders."Order_ID" = "Details"."Order_ID"
)
SELECT
    "Payment Mode", 
    count("Order_ID") as "Total times used for payment"  
FROM customer_orders
GROUP BY "Payment Mode"
ORDER BY "Total times used for payment" desc
-- Average Quantity ordered by customers

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
    DISTINCT("CustomerName") as Customer_Name,  
	ROUND(AVG("Amount"), 1) as average_quantity_purchased
FROM customer_orders
GROUP BY Customer_Name
ORDER BY average_quantity_purchased desc
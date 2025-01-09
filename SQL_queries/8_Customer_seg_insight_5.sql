-- Customers frequency of purchase

WITH customer_orders AS ( SELECT orders."Order_ID", orders."Order_Date",
							"CustomerName", orders."State",
							orders."City", "Category",
							"Sub-Category", "Amount", "Quantity", 
							"Payment Mode", "Profit"
		    FROM orders
		    JOIN "Details" 
		    ON orders."Order_ID" = "Details"."Order_ID"
)
SELECT "CustomerName" as CustomerName,
    TO_CHAR("Order_Date", 'Month') AS "month_orders_were_made", 
    COUNT("Order_ID") AS "Total_orders_made",
    SUM(COUNT("Order_ID")) OVER (PARTITION BY TO_CHAR("Order_Date", 'Month')) AS total_monthly_orders
FROM customer_orders
GROUP BY TO_CHAR("Order_Date", 'Month'), "CustomerName",
		"Order_Date"
ORDER BY CustomerName, Extract(month from "Order_Date");
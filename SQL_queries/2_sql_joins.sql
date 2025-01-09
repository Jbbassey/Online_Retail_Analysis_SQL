--joining the products_order table and the Customer_details

WITH customer_orders as (select orders."Order_ID", orders."Order_Date", orders."State", 
					orders."City", "Category",
		"Sub-Category", "Amount", "Quantity", "Payment Mode", "Profit"
		from "orders"
		join "Details" 
		on orders."Order_ID" = "Details"."Order_ID"
)
select *
from customer_orders
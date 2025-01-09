-- Profits made from product orders

with customer_orders as (select orders."Order_ID", orders."Order_Date", 
					"CustomerName", orders."State", 
					orders."City", "Category",
					"Sub-Category", "Amount", "Quantity",
					"Payment Mode", "Profit"
		from "orders"
		join  "Details" 
		on orders."Order_ID" = "Details"."Order_ID"
)
select "Sub-Category", sum("Profit") as total_Profit_made
from customer_orders
group by "Sub-Category"
order by total_Profit_made desc
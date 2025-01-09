-- customers with corresponding quantity ordered and profit made

with customer_orders as (select orders."Order_ID", orders."Order_Date", "CustomerName", orders."State", orders."City", "Category",
		"Sub-Category", "Amount", "Quantity", "Payment Mode", "Profit"
		from orders
		join  "Details" 
		on orders."Order_ID" = "Details"."Order_ID"
)
select "CustomerName", "Category", sum("Quantity") as total_quantity_purchased, sum("Profit") as sum_profit_made
from customer_orders
group by "Category", "CustomerName"
order by "Category", total_quantity_purchased desc
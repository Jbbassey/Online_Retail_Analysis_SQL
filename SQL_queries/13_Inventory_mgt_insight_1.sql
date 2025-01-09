-- Total Quantity of products Ordered

with customer_orders as (select orders."Order_ID", "Order_Date", "State", "City", "Category",
		"Sub-Category", "Amount", "Quantity", "Payment Mode", "Profit"
		from orders
		join  "Details" 
		on orders."Order_ID" = "Details"."Order_ID"
) 
select "Sub-Category", sum("Quantity") as Total_Quantity_ordered
from customer_orders
group by "Sub-Category"
order by Total_Quantity_ordered desc
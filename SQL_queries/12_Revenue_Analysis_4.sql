-- states with corresponding revenue and profit generated with product

with customer_orders as (select orders."Order_ID", "Order_Date", "State", "City", "Category",
		"Sub-Category", "Amount", "Quantity", "Payment Mode", "Profit" 
		from orders
		join  "Details" 
		on orders."Order_ID" = "Details"."Order_ID"
)
select "State", "Category", sum("Quantity") * sum("Amount") as Total_revenue_generated,
		sum("Profit") as sum_of_profit
from customer_orders
group by "State", "Category"
order by "State", Total_revenue_generated desc
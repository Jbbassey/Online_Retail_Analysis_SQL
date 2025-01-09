-- Most used Payment Mode

 WITH customer_orders as (select orders."Order_ID", orders."Order_Date", "CustomerName", orders."State", orders."City", "Category",
		"Sub-Category", "Amount", "Quantity", "Payment Mode", "Profit"
		from orders
		join  "Details" 
		on orders."Order_ID" = "Details"."Order_ID"
)
select "Payment Mode", count("Order_ID") as "Total times used for payment"  
from customer_orders
group by "Payment Mode"
order by "Total times used for payment" desc
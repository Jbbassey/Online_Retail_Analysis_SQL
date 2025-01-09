-- Average Quantity ordered by customers

 WITH customer_orders as (select orders."Order_ID", orders."Order_Date", "CustomerName", orders."State", orders."City", "Category",
		"Sub-Category", "Amount", "Quantity", "Payment Mode", "Profit" 
		from orders
		join  "Details" 
		on orders."Order_ID" = "Details"."Order_ID"
)
select distinct("CustomerName") as Customer_Name,  
		Round(avg ("Amount"), 1) as average_quantity_purchased
from customer_orders
group by Customer_Name
order by average_quantity_purchased desc
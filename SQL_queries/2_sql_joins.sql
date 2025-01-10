-- Joining the Orders table and the Details table

WITH customer_orders AS (
    SELECT 
        Order_ID, Order_Date,
        State, City,
        Category, Sub-Category,
        Amount, Quantity,
        Payment Mode, Profit
    FROM orders
    JOIN Details 
    ON orders.Order_ID = Details.Order_ID
)
--displaying the joined tables
SELECT *
FROM customer_orders;

--Creating the orders table

CREATE TABLE Orders (
	Order_ID VARCHAR(255),
	Order_Date DATE,
	Customer_Name VARCHAR(255),
	State VARCHAR(255),
	City VARCHAR(255)	
);


--Creating the Details table

CREATE TABLE Details (
    Order_ID VARCHAR(255),
	Amount INT,
	Profit INT,
	Quantity INT,
    Category VARCHAR(255),
    Sub_Category VARCHAR(255),
	Payment_Mode VARCHAR(255)
);
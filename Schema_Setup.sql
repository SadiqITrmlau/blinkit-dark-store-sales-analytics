-- Create new database
drop database if exists blinkit_operations;
create database blinkit_operations;
use blinkit_operations;


-- Orders Table 

-- Drop Table Orders if exists
DROP TABLE Orders;

create table Orders (
	Order_ID varchar(20) primary key,
    Customer_ID varchar(20),
    Store_ID varchar(50),
    Order_Timestamp datetime,
    Total_Amount decimal(10,2),
    Order_Status varchar(20)
);

select * from Orders;
-- verifying whether data imported or not 
select count(*) from Orders;




-- Deliveries Table
create table Deliveries (
	Delivery_ID varchar(20) primary key,
    Order_ID varchar(20),
    Rider_ID varchar(20),
    Picked_Timestamp datetime,
    Dispatched_Timestamp datetime,
    Delivered_Timestamp datetime,
    Distance_km decimal(5,2),
    foreign key (Order_ID) references Orders(Order_ID)
);

select * from Deliveries;
-- verifying whether data imported or not 
select count(*) from Deliveries;

-- Inventory Table
create table Inventory (
	SKU_ID varchar(20),
    Store_ID varchar(20),
    Category varchar(20),
    Stock_Quantity int,
    Daily_Sales_Victory int,
    primary key (SKU_ID, Store_ID)
);

select * from Inventory;
-- verifying whether data imported or not 
select count(*) from Inventory;

-- Orders Defects Table
create table Order_Defects (
	Defect_ID varchar(20) primary key,
    Order_ID varchar(20),
    Defect_Type  varchar(50),
    Refund_Amount decimal(10,2),
    foreign key (Order_ID) references Orders(Order_ID)
);

select * from Order_Defects;
-- verifying whether data imported or not 
select count(*) from Order_Defects;
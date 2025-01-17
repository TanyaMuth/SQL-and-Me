******************
Grubhub Database				
INFO 1620
Written by Tanya Muth
Last Updated Jaunary 2024
******************/

CREATE TABLE Orders 
  (Order_Number integer NOT NULL,
  Customer_ID integer NOT NULL,
  Order_datetime DATETIME,
  Order_status VARCHAR(25),
  CONSTRAINT Order_PK PRIMARY KEY (Order_Number))
;

CREATE TABLE Driver
  (Driver_ID integer NOT NULL,
  Driver_Phone VARCHAR (25),
  Driver_Fname VARCHAR(25),
  Driver_Lname VARCHAR(25),
  Driver_LicenseNumber VARCHAR(25),
  Driver_LicensePlate VARCHAR(7),
  Driver_Status VARCHAR(25),
  CONSTRAINT Driver_PK PRIMARY KEY(Driver_ID))
;

CREATE TABLE Restaurant
  (Restaurant_ID integer NOT NULL,
  Restaurant_Phone VARCHAR(25),
  Restaurant_Name VARCHAR(25),
  Restaurant_Street VARCHAR(25),
  Restaurant_APT VARCHAR(25),
  Restaurant_City VARCHAR(25),
  Restaurant_State VARCHAR(25),
  Restaurant_Zip integer,
  Restaurant_PaymentID integer, 
  Restaurant_Cuisine VARCHAR(25),
  CONSTRAINT Restaurant_PK PRIMARY KEY(Restaurant_ID))
;

CREATE TABLE Customer 
  (Customer_ID integer NOT NULL,
  Customer_Phone VARCHAR(25), 
  Customer_Fname VARCHAR(25), 
  Customer_Lname VARCHAR(25), 
  Customer_Street VARCHAR(25), 
  Customer_APT VARCHAR(25),
  Customer_City VARCHAR(25),
  Customer_State VARCHAR(25),
  Customer_Zip integer,
  Customer_PaymentID integer,
  CONSTRAINT Customer_PK PRIMARY KEY(Customer_ID))
;

CREATE TABLE Grubhub 
  (Driver_PaymentID integer NOT NULL,
  Customer_PaymentID integer NOT NULL,
  Restaurant_PaymentID integer NOT NULL,
  CONSTRAINT Grubhub_PK PRIMARY KEY(Driver_PaymentID, Customer_PaymentID, Restaurant_PaymentID))
;
  
insert into Driver(Driver_ID, Driver_Phone, Driver_Fname, Driver_Lname, Driver_LicenseNumber, Driver_LicensePlate, Driver_Status)
values(1, '286-937-2250','Henry','Roth','C04790049','IUC989','active'),
  (2, '815-605-0336','Charity','Osborne','D89973937','REW222','active'),
  (3, '943-893-6193','Fritz','Macias','U06119817','XUA177','active'),
  (4, '513-284-9064','Brenden','Hill','X22173227','IOL455','active'),
  (5, '909-477-8843','Leah','Peters','V44276914','AJA879','inactive');

insert into Customer(Customer_ID, Customer_Phone, Customer_Fname, Customer_Lname, Customer_Street, Customer_APT, Customer_City, Customer_State, Customer_Zip, Customer_PaymentID)
values(1, '402-553-4397','April','Ludgate','123 S 55 Avenue','NULL','omaha','ne',68132,23456),
  (2, '234-432-5437','Leslie','Knope','4387 Waffles Drive', 'null', 'Pawnee','Indiana', 46011,98754),
  (3, '456-987-3265','Ron','Swanson','987 Bacon Avenue', 'null','Pawnee','Indiana',46011,234789),
  (4, 'null', 'Andy', 'Dwyer', '2468 The Pit', 'null', 'Pawnee', 'Indiana', 46011, 12390);
       

       
       
insert into Restaurant(Restaurant_ID, Restaurant_Phone, Restaurant_Name, Restaurant_Street, Restaurant_APT, Restaurant_City, Restaurant_State, Restaurant_Zip, Restaurant_PaymentID,  Restaurant_Cuisine)
values(1, 678-893-1568,'Paunch Burger','6872 Lard Lane','null','Pawnee','INDIANA',46011, 4826, 'Fast Food'),
  (2, 456-987-3185,'JJs Diner','23428 Main Street','null', 'Pawnee', 'Indiana', 46011, 78623, 'Breakfast'),
  (3, 786-235-4862,'Mulligans','6876 Classy Road','null', 'Indianapolis','Indiana',46077, 48623, 'Steakhouse')
;

insert into Orders(Order_Number integer, Customer_ID, Order_datetime, Order_status)
values(


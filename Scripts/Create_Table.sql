-- Local Drive Location
-- @C:\Users\Sushil\Desktop\DatabaseProject\Create_Table.sql   

-- Author: Sushil Pun
--15/03/2017

-- CREATING AN OBJECT TYPE NAME ADDRESS TYPE
CREATE OR REPLACE TYPE address_type AS OBJECT (
street		VARCHAR2(25),
city		VARCHAR2(25),
country		VARCHAR2(20) )
/

CREATE TABLE addresses OF address_type;

-- CREATING A CUSTOMER TABLE
CREATE TABLE customers(
citizenship_number		VARCHAR2(20),	
first_name				VARCHAR2(10),
last_name				VARCHAR2(10),
address					REF address_type SCOPE IS addresses);

-- CREATING A CAR MODEL TABLE
CREATE TABLE car_models(
engine_number			VARCHAR2(20),
model					VARCHAR2(12),
manufacturer			VARCHAR2(30),
price					NUMBER(8,2));

-- CREATING A CUSTOMER CAR TABLE
CREATE TABLE customer_cars(
vechical_number			VARCHAR2(20),		
engine_number			VARCHAR2(20),		
c_citizenship_number	VARCHAR2(20),		
car_color				VARCHAR2(15));


CREATE TYPE specilization_type AS OBJECT(
-- catagory for example engine, wheels or general 
catagory 	VARCHAR2(10),	
-- block coloumn specify mechanic works in which department or block	
block 		NUMBER(6),	
-- mechanic wage for doing specific task		
charge 		NUMBER(10, 2));		
/

CREATE TYPE specilization_varray_type AS VARRAY(50) OF specilization_type;
/

-- -- CREATING A MECHANIC TABLE
CREATE TABLE mechanics (
mechanic_id         VARCHAR2(6),
first_name			VARCHAR2(10),
last_name			VARCHAR2(10),
address				address_type,
specilization		specilization_varray_type);


-- CREATING A NESTED TABLE OF TYPE BOOKING_ITEM_TYPE
CREATE OR REPLACE TYPE booking_item_type AS OBJECT(
customer_last_name				VARCHAR2(10),
customer_car_vechical_number	VARCHAR2(15), 
manufacturer					VARCHAR2(30),
amount							NUMBER(10,2));
/

CREATE TYPE booking_item_table_type AS TABLE OF booking_item_type;
/

-- CREATING A BOOKING TABLE
CREATE TABLE bookings(
bill_number			VARCHAR2(8),
mechanic_id			VARCHAR2(6),
booking_date		DATE,
due_date			DATE,
booking_item		booking_item_table_type)
NESTED TABLE booking_item STORE AS booking_item_table;


--test
/*
SELECT bi.amount
FROM bookings b,
TABLE(b.booking_item) bi
WHERE bi.amount > 1000;

SELECT sp.charge
FROM mechanics m,
TABLE (m.specilization) sp
WHERE sp.charge > 200;
*/

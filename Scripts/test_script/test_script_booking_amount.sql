-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\test_script\test_script_booking_amount.sql      

-- Author: Sushil Pun
--15/03/2017

/* TEST CONDITION FOR BOOKING AMOUNT OF BOOKING_ITEM_TABLE */

-- VALID CASE
-- BEFORE CREATING PROCEDURE proc_booking_item_type
SELECT bi.customer_last_name, bi.customer_car_vechical_number, bi.amount
FROM bookings b,
TABLE(b.booking_item) bi
WHERE bi.amount > 1000;

-- SHOW customer_last_name		customer_car_vechical_number		booking amount	

-- AFTER EXECUTING PROCEDURE proc_booking_item_type
SET SERVEROUTPUT ON
EXECUTE proc_booking_item_type(1000);

-- SQL PLUS PROMPT SHOW customer number, IN NEWLINE customer_car_vechical_number, and IN NEWLINE booking amount


-- INVALID CASE
-- BEFORE CREATING PROCEDURE proc_booking_item_type
SELECT bi.customer_last_name, bi.customer_car_vechical_number, bi.amount
FROM bookings b,
TABLE(b.booking_item) bi
WHERE bi.amount > 2000;

-- SQL PLUS PROMPT SHOW NO ROW SELECTED BECAUSE NO BOOKING AMOUNT IS GREATER THAN 2000

-- AFTER EXECUTING PROCEDURE PROC_CUSTOMER_CITIZENSHIP
SET SERVEROUTPUT ON
EXECUTE proc_booking_item_type(2000);
-- SQL PLUS PROMPT SHOW ONLY PL/SQL PROCEDURE SUCCESSFULLY COMPLETED
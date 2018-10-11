-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\test_script\test_script_bill_no.sql 

-- Author: Sushil Pun
--15/03/2017

/* TESTING CONDITION WHEN BOOKING TABLE BILL NUMBER IS VALID AND INVALID*/
-- VALID CASE
-- BEFORE CREATING PROCEDURE proc_bill_number
SELECT bill_number, mechanic_id, booking_date, due_date
FROM bookings
WHERE bill_number = 10001;

-- SHOW bill_number		mechanic_id		booking_date	due_date

-- AFTER EXECUTING PROCEDURE proc_bill_number
SET SERVEROUTPUT ON
EXECUTE proc_bill_number(10001);

-- SQL PLUS PROMPT SHOW bill_number, IN NEWLINE mechanic_id, IN NEWLINE booking_date and IN NEWLINE due_date


-- INVALID CASE
-- BEFORE CREATING PROCEDURE PROC_CUSTOMER_CITIZENSHIP
SELECT bill_number, mechanic_id, booking_date, due_date
FROM bookings
WHERE bill_number = 10003;

-- SQL PLUS PROMPT SHOW NO ROW SELECTED BECAUSE BILL_NUMBER DOESNOT EXIT

-- AFTER EXECUTING PROCEDURE PROC_CUSTOMER_CITIZENSHIP
SET SERVEROUTPUT ON
EXECUTE proc_bill_number(10003);
-- SQL PLUS PROMPT SHOW BILL NUMBER NOT VALID
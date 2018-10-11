-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

/*	TESTING TRIGGER trig_booking_date_ck 
	DUE DATE MUST NOT BE LESS THAN BOOKING DATE
	THIS TRIGGER IS FIRE WHENEVER USER TRY IT INSERT DUE DATE LESS THAN BOOKING DATE
*/

-- BEFORE CREATING TRIGGER trig_booking_date_ck
-- IF IN CASE TRIGGER IS THERE IT MUST BE DROPPED

DROP TRIGGER trig_booking_date_ck;

INSERT INTO bookings
(bill_number, mechanic_id, booking_date, due_date, booking_item)
VALUES (10003, 1001, '04-JAN-2017', '02-JAN-2017',
booking_item_table_type(
booking_item_type('NORTON','BA54PA-299', 'HONDA', 1300),
booking_item_type('BULOCK','BA72PA-4575', 'HONDA', 1300)));

-- SQL PROMPT SHOW WHAT EVER THE DUE DATE IS IT CREATES ONE NEW ROW
ROLLBACK;
-- AFTER CREATING TRIGGER trig_booking_date_ck
INSERT INTO bookings
(bill_number, mechanic_id, booking_date, due_date, booking_item)
VALUES (10003, 1001, '04-JAN-2017', '02-JAN-2017',
booking_item_table_type(
booking_item_type('NORTON','BA54PA-299', 'HONDA', 1300),
booking_item_type('BULOCK','BA72PA-4575', 'HONDA', 1300)));

-- SQL PROMPT DISPLAY ERROR MESSAGE SAYING DUE DATE MUST BE GREATER THAN BOOKING DATE
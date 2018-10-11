-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

SET SERVEROUTPUT ON
/*	THIS TRIGGER IS FIRED WHENEVER THE BOOKING DATE IS GREATER THAN THE DUE DATE OF BOOKINGS TABLE.
*/
CREATE OR REPLACE TRIGGER trig_booking_date_ck
BEFORE INSERT OR UPDATE OF booking_date, due_date ON bookings 
FOR EACH ROW

WHEN 
(NEW.booking_date > NEW.due_date)

BEGIN
	RAISE_APPLICATION_ERROR(-20000, 'ERROR - Due date must be after booking date!');

END;
/

INSERT INTO bookings
(bill_number, mechanic_id, booking_date, due_date, booking_item)
VALUES ('10003', '1001', '04-JAN-2017', '02-JAN-2017',
booking_item_table_type(
booking_item_type('NORTON','BA54PA-299', 'HONDA', 1300),
booking_item_type('BULOCK','BA72PA-4575', 'HONDA', 1300)));

ROLLBACK;

-- DROP TRIGGER
-- DROP TRIGGER trig_booking_date_ck;
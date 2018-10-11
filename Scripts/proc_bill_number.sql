-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

-- PROCEDURE TO CHECK WHETHER THE GIVEN BILL NUMBER IS A VALID OR NOT
CREATE OR REPLACE PROCEDURE proc_bill_number(in_bill_number bookings.bill_number%TYPE)IS
	vn_bill_number	VARCHAR2(8);
	vn_mechanic_id	VARCHAR2(6);
	vd_booking_date	DATE;
	vd_due_date	DATE;

BEGIN
	SELECT bill_number, mechanic_id, booking_date, due_date
	INTO vn_bill_number, vn_mechanic_id, vd_booking_date, vd_due_date
	FROM bookings
	WHERE bill_number = in_bill_number;
	
	IF 	vn_bill_number = in_bill_number THEN 
		DBMS_OUTPUT.PUT_LINE('BILL NUMBER : '|| in_bill_number || CHR(10) ||
							'MECHANIC ASSIGNED : '|| vn_mechanic_id || CHR(10) ||
							'BOOKING DATE : '|| vd_booking_date || CHR(10) ||
							'DUE DATE : '|| vd_due_date);
	END IF;
	-- EXCEPTION IS THROWN WHEN THE GIVEN PERSON CITIZENSHIP NUMBER IS NOT FOUND 
	EXCEPTION
	WHEN no_data_found THEN 
		DBMS_OUTPUT.PUT_LINE('BILL NUMBER NOT VALID');
		
END;
/
SHOW ERRORS;

-- SET SERVEROUTPUT ON
-- EXECUTE proc_bill_number('500');
SHOW ERRORS;


-- DROP
--DROP PROCEDURE proc_bill_number;
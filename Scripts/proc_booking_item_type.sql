-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

-- procedure using cursor to find out the booking item details which is a nested table inside bookings table
CREATE OR REPLACE PROCEDURE proc_booking_item_type(in_amount NUMBER) IS
	vc_name				VARCHAR2(25);
	vc_vechical_number	VARCHAR2(15);
	vn_booking_cost 	NUMBER(10,2);
	
	CURSOR C1 IS	SELECT bi.customer_last_name, bi.customer_car_vechical_number, bi.amount INTO vc_name, vc_vechical_number, vn_booking_cost
					FROM bookings b,
					TABLE(b.booking_item) bi
					WHERE bi.amount > in_amount;
BEGIN
	
	IF NOT C1%isopen THEN 
		OPEN C1;
	END IF;	
	LOOP
		-- reference https://ss64.com/oraplsql/cursor_fetch_close.html
		FETCH C1 INTO vc_name, vc_vechical_number, vn_booking_cost;
		EXIT WHEN C1%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('CUSTOMER '|| C1%rowcount);
		DBMS_OUTPUT.PUT_LINE('------------');
		DBMS_OUTPUT.PUT_LINE('CUSTOMER LASTNAME : '||vc_name|| CHR(10)||
							'VECHICAL NUMBER : '|| vc_vechical_number ||CHR(10)||
							'BOOKING AMOUNT : '|| vn_booking_cost);
		DBMS_OUTPUT.PUT_LINE('------------');					
	END LOOP;
	CLOSE C1;
END;
/
SHOW ERROR;

-- SET SERVEROUTPUT ON
-- EXECUTE proc_booking_item_type(2000);

-- DROP
--DROP PROCEDURE proc_booking_item_type;
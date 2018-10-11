-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

/*	THIS IS A IMPLICIT CURSOR USING THE WHILE LOOP
	FIRST IT WILL SHOW THE RECORD OF EACH ROW OF CAR MODEL TABLE
	THEN IT ADDS THE PRICE COLOUMN OF EACH RECORD UNTIL NO RECORD IS FOUND
	FINALLY IT SHOW'S THE TOTAL PRICE OF CAR MODEL PRICE COLOUMN
*/

SET SERVEROUTPUT ON
DECLARE
	vc_manufacturer		VARCHAR2(20);
	vc_model			VARCHAR2(15);
	vn_price			NUMBER(10);
	vn_total_price		NUMBER(10) := 0;
	
	CURSOR cursorValue IS
    SELECT manufacturer, model, price
	INTO vc_manufacturer, vc_model, vn_price
    FROM car_models;
  
BEGIN
	OPEN cursorValue;
	FETCH cursorValue INTO vc_manufacturer, vc_model, vn_price;
	WHILE (cursorValue%FOUND) LOOP
		DBMS_OUTPUT.PUT_LINE('VECHICAL '|| cursorValue%rowcount);
		DBMS_OUTPUT.PUT_LINE('====================');
		DBMS_OUTPUT.PUT_LINE('MANUFACTURER : '|| vc_manufacturer|| CHR(10)|| 
							'MODEL : '|| vc_model || CHR(10) || 'PRICE : '|| vn_price);
		DBMS_OUTPUT.PUT_LINE('====================');
		vn_total_price := vn_total_price + vn_price;
		FETCH cursorValue INTO vc_manufacturer, vc_model, vn_price;
	END LOOP;
	CLOSE cursorValue;
	DBMS_OUTPUT.PUT_LINE('THE WHOLE TOTAL PRICE OF THE CAR STORE IN DATABASE IS : '|| vn_total_price);
END;
/
SHOW ERRORS;

-- DROP PROCEDURE proc_total_price;

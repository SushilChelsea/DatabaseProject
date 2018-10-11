-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\proc_switch_case.sql   

-- Author: Sushil Pun
--15/03/2017

/*	USING THE SWITCH CASE STATEMENT PROCEDURE OUTPUT THE CATEGORY OF CAR
	IF CAR IS BELOW 10000 THEN IT'S LOW COST CAR
	IF-ELSE CAR IS BELOW 40000 IT'S AVERAGE COST CAR
	ELSE THE CAR IS HIGH COST CAR.
*/

-- procedure takes a parameter model and matches it with the model of car_models table
-- evaluates price and show it's catagory
CREATE OR REPLACE PROCEDURE pro_car_category(in_model car_models.model%TYPE) IS
	vn_price		NUMBER(10, 2);
	vc_manufacturer VARCHAR2(20);
	vc_model		VARCHAR2(12);
	
BEGIN
	SELECT manufacturer, model, price
	INTO vc_manufacturer, vc_model, vn_price
	FROM car_models
	WHERE model = in_model;
	
	
	CASE 
		WHEN vn_price < 10000 THEN DBMS_OUTPUT.PUT_LINE('LOW COST CAR');
		WHEN vn_price < 40000 THEN DBMS_OUTPUT.PUT_LINE('AVERAGE COST CAR');
		ELSE					   DBMS_OUTPUT.PUT_LINE('HIGH COST CAR');
	END CASE;
	
END;
/
SHOW ERRORS;

SET SERVEROUTPUT ON
EXECUTE pro_car_category('R8');

-- DROP PROCEDURE pro_car_category;		

-- REFERENCE https://docs.oracle.com/cd/A97630_01/appdev.920/a96624/04_struc.htm
		
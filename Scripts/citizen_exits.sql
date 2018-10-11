-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\citizen_exits.sql   

-- Author: Sushil Pun
--15/03/2017

-- PROCEDURE TO CHECK WHETHER THE GIVEN PERSON ID IS A VALID CUSTOMER OR NOT
CREATE OR REPLACE PROCEDURE proc_customer_citizenship(in_citizenship_number customers.citizenship_number%TYPE)IS
	vc_searched_citizen_number VARCHAR2(20);
	vc_citizen_first_name	   VARCHAR2(20);
	vc_citizen_last_name	   VARCHAR2(20);

BEGIN
	SELECT 	citizenship_number, first_name, last_name
	INTO	vc_searched_citizen_number, vc_citizen_first_name, vc_citizen_last_name
	FROM 	customers
	WHERE	citizenship_number = in_citizenship_number;
	
	IF 	vc_searched_citizen_number = in_citizenship_number THEN 
		DBMS_OUTPUT.PUT_LINE('CITIZENSHIP NUMBER : '|| in_citizenship_number || CHR(10)||
							'FirstName : ' || vc_citizen_first_name || CHR(10) ||
							'LastName : ' || vc_citizen_last_name);
	END IF;
	-- EXCEPTION IS THROWN WHEN THE GIVEN PERSON CITIZENSHIP NUMBER IS NOT FOUND 
	EXCEPTION
	WHEN no_data_found THEN 
		DBMS_OUTPUT.PUT_LINE('CITIZENSHIP NOT FOUND');
		
END;
/
SHOW ERRORS;
-- SET SERVEROUTPUT ON
-- EXECUTE proc_customer_citizenship('CN5129');

-- DROP
--DROP PROCEDURE proc_customer_citizenship;

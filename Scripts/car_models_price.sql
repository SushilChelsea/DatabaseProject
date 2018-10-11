-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\car_models_price.sql        

-- Author: Sushil Pun
--15/03/2017

/*	FUNCTION PARAMETER ACCEPT PRICE FROM USER AND COUNT THE CAR WHICH ARE MORE COSTLY THAN THE USER INPUT
	AND RETURN THE NUMBER OF CAR TO THE PROCEDURE, WHICH WILL DISPLAY THE MESSAGE
*/

CREATE OR REPLACE FUNCTION func_car_models_price(in_price car_models.price%TYPE)
RETURN NUMBER IS 
	vn_car_price NUMBER(8);

BEGIN
	SELECT COUNT(*)
	INTO vn_car_price
	FROM car_models
	WHERE price > in_price;

	-- RETURNS THE NUMBER OF CAR COUNTED TO PROCEDURE
	RETURN vn_car_price;		


END;
/
SHOW ERRORS;

-- CREATING PROCEDURE WHICH ACCEPT A PRICE OF TYPE (CAR_MODELS TABLE PRICE COLOUMN)
CREATE OR REPLACE PROCEDURE proc_car_models_price(in_price car_models.price%TYPE) IS
	vn_no_of_cars NUMBER(5) ;

BEGIN

	-- calling function func_car_models_price and storing it in vn_no_of_cars
	vn_no_of_cars := func_car_models_price(in_price); 
   
	DBMS_OUTPUT.PUT_LINE ('The Number of Car greater than price '|| in_price || ' are : '|| vn_no_of_cars );

END proc_car_models_price;
/
SHOW ERRORS;

/*
SET SERVEROUTPUT ON
EXECUTE proc_car_models_price(20000);
SHOW ERRORS;
*/
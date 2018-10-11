-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\proc_insert_car_model.sql     

-- Author: Sushil Pun
--15/03/2017

/* INSERTING A DATA USING A PROCEDURE */
CREATE OR REPLACE PROCEDURE proc_insert_car_model(
	in_engine_number	IN car_models.engine_number%TYPE,
	in_model			IN car_models.model%TYPE,
	in_manufacturer		IN car_models.manufacturer%TYPE,
	in_price			IN car_models.price%TYPE)
IS
BEGIN

  INSERT INTO car_models(engine_number, model, manufacturer, price)
  VALUES (in_engine_number, in_model, in_manufacturer, in_price);
  
	-- IF ABOVE STATEMENT IS TRUE IT WILL DISPLAY ROW CREATED IF NOT IT WILL GO TO ELSE STATEMENT
	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE('ROW CREATED');
	ELSE
		DBMS_OUTPUT.PUT_LINE('INPUT VALUE MAY BE WRONG');
	END IF;
	
  COMMIT;

END;
/
SHOW ERRORS;
SET SERVEROUTPUT ON
--EXECUTE proc_insert_car_model('111212136', 'CBZ', 'HONDA', 60000);

-- DROP PROCEDURE proc_insert_car_model;


-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

/*	TRIGGER IS FIRE WHEN USER INSERT OR UPDATE VALUE INTO CAR MODEL TABLE
	DELETE OPERATION CANNOT BE DONE BECAUSE IT'S PK IS FK IN ANOTHER TABLE
*/
CREATE OR REPLACE TRIGGER trig_car_price
BEFORE DELETE OR INSERT OR UPDATE ON car_models
-- reference https://docs.oracle.com/cloud/latest/db112/LNPLS/triggers.htm#LNPLS99955
FOR EACH ROW 
WHEN (NEW.engine_number > 0) 	
DECLARE 
   price_difference NUMBER; 
BEGIN 
	price_difference := 0;
	price_difference := :NEW.price  - :OLD.price; 
	dbms_output.put_line('Old price: ' || :OLD.price); 
	dbms_output.put_line('New price: ' || :NEW.price); 
	dbms_output.put_line('price difference: ' || price_difference); 
END; 
/ 

/*
INSERT INTO car_models (engine_number, model, manufacturer, price)
VALUES ('111212146',  'i10', 'HUNDAI', 22000);

UPDATE car_models SET price = 30000
WHERE model = 'i20';

DELETE CANNOT BE DONE BECAUSE IT'S DATA IS LINK TO CUSTOMER CAR TABLE
*/

-- DROP TRIGGER trig_car_price;
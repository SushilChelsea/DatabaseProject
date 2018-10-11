-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

/*	THIS IS A TEST.. INSERTING A DATA USING A PROCEDURE 
	IN THE TABLE CUSTOMER CAR WHERE 
	ENGINE NUMBER AND CITIZENSHIP NUMBER ARE FOREIGN KEY, IF TRY IT FAIL'S DUE TO INTEGRITY CONSTRAINTS
	SO MUST NOT EXECUTE THE PROCEDURE
*/

CREATE OR REPLACE PROCEDURE proc_insert_customer_car(
	   in_vechical_number IN customer_cars.vechical_number%TYPE,
	   in_engine_number IN customer_cars.engine_number%TYPE,
	   in_citizen_number IN customer_cars.c_citizenship_number%TYPE,
	   in_car_color IN customer_cars.car_color%TYPE)
IS
BEGIN

  INSERT INTO customer_cars  (vechical_number, engine_number, c_citizenship_number, car_color)
  VALUES (in_vechical_number, in_engine_number, in_citizen_number, in_car_color);

  COMMIT;

END;
/
SHOW ERRORS;

--EXECUTE proc_insert_customer_car('BA50PA-299', '111212136', 'CN5129', 'RED');

-- DROP PROCEDURE proc_insert_customer_car;
-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\proc_delete_car_model.sql     

-- Author: Sushil Pun
--15/03/2017

/* DELETING A ROW FROM A CAR MODEL TABLE USING A PROCEDURE */
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE proc_delete_car_model(in_model	IN car_models.model%TYPE )
IS
BEGIN

	DELETE FROM car_models
	WHERE model = in_model;
	-- IF ABOVE STATEMENT IS TRUE IT WILL DISPLAY ROW DELETED IF NOT IT WILL GO TO ELSE STATEMENT
	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE('ROW DELETED');
	ELSE
		DBMS_OUTPUT.PUT_LINE('NO SUCH MODEL AVAILABLE');
	END IF;
  COMMIT;

END;
/
SHOW ERRORS;
SET SERVEROUTPUT ON
--EXECUTE proc_delete_car_model('CBZ');

-- DROP PROCEDURE proc_delete_car_model;
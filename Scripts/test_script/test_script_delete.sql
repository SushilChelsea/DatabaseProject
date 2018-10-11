-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

/* TEST CONDITION DELETING VALUE INTO CUSTOMER CAR TABLE USING PROCEDURE */

-- BEFORE EXECUTING PROCEDURE proc_delete_car_model
DELETE FROM car_models
WHERE model = 'CBZ';

-- SQL PLUS PROMPT SHOW  1 ROW DELETED
-- ROLLBACK;

-- AFTER EXECUTING PROCEDURE proc_delete_car_model
SET SERVEROUTPUT ON
EXECUTE proc_delete_car_model('CBZ');
-- SQL PLUS PROMPT SHOW ROW DELETED


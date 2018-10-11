-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\test_script\test_script_insert.sql    

-- Author: Sushil Pun
--15/03/2017

/* TEST CONDITION INSERTING VALUE INTO CUSTOMER CAR TABLE USING PROCEDURE */

-- BEFORE EXECUTING PROCEDURE proc_insert_car_model
INSERT INTO car_models(engine_number, model, manufacturer, price)
VALUES (111212136, 'CBZ', 'HONDA', 60000);

-- SQL PLUS PROMPT SHOW  1 ROW CREATED
-- ROLLBACK;

-- AFTER EXECUTING PROCEDURE proc_insert_car_model
SET SERVEROUTPUT ON
EXECUTE proc_insert_car_model(111212136, 'CBZ', 'HONDA', 60000);
-- SQL PLUS PROMPT SHOW ROW CREATED


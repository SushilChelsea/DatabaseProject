-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\proc_for_loop.sql    

-- Author: Sushil Pun
--15/03/2017

/*	EMPTY PARAMETER PROCEDURE USING FOR LOOP TO DISPLAY ALL THE MECHANICS
	FIRSTNAME AVAILABLE IN THE TABLE MECHANICS.
*/

CREATE OR REPLACE PROCEDURE proc_for_loop IS
    vn_counter  NUMBER := 0;
	BEGIN
	DBMS_OUTPUT.put_line ('Procedure For Loop Starts....');
    FOR rec IN (SELECT * FROM mechanics)
    LOOP
		vn_counter := vn_counter + 1;
		DBMS_OUTPUT.put_line ('Record ' || vn_counter || ' mechanics is- ' || rec.first_name);
    END LOOP;
 
    DBMS_OUTPUT.put_line ('Procedure For Loop Completed!');
END;
/
SHOW ERRORS;
-- SET SEVEROUTPUT ON
-- EXECUTE proc_for_loop;
-- DROP PROCEDURE proc_for_loop;
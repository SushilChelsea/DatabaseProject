-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

-- GIVES ALL THE USER DEFINED FUNCTION
select * from user_objects where object_type = 'FUNCTION';

-- GIVES ALL THE USER DEFINED PROCEDURE
select * from user_objects where object_type = 'PROCEDURE';
-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\query\build_in_func_query.sql  

-- Author: Sushil Pun
--15/03/2017

--query for finding minimum price in car_models table.
SELECT MIN(price) AS SmallestPrice
FROM car_models;

--query for finding maximum price in car_models table.
SELECT MAX(price) AS MaxPrice
FROM car_models;

--query for counting model of cars in car_models table.
SELECT COUNT(model)
FROM car_models;

--query for counting number of citizenship_number in customers table.
SELECT COUNT(citizenship_number)
FROM customers;

--query for finding average price in car_models table.
SELECT AVG(price)
FROM car_models;

--query for finding sum of price in car_models table.
SELECT SUM(price) AS Total
FROM car_models;


	

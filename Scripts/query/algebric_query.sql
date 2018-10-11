-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\query\algebric_query.sql       

-- Author: Sushil Pun
--15/03/2017

/*
SELECT c.address.city, c.address.country
FROM customers c
UNION
SELECT m.address.city, m.address.country
FROM mechanics m;

*/

SELECT c.address.city, c.address.country
FROM customers c
WHERE c.address.country = 'UK'
INTERSECT
SELECT m.address.city, m.address.country
FROM mechanics m
WHERE m.address.country = 'UK';



/*
SELECT street, city, country
FROM addresses
MINUS
SELECT m.address.street, m.address.city, m.address.country
FROM mechanics m;
*/

/*
SELECT street, city, country
FROM addresses
MINUS
(SELECT c.address.street, c.address.city, c.address.country
FROM customers c
UNION
SELECT m.address.street, m.address.city, m.address.country
FROM mechanics m);
*/

SELECT m.mechanic_id, m.address.country
FROM mechanics m;

SELECT c.citizenship_number, c.address.country
FROM customers c;
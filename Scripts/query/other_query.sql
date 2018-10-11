-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\other_query.sql     

-- Author: Sushil Pun
--15/03/2017

--query for finding price using between in car_models table.
SELECT model, manufacturer, price
FROM car_models
WHERE price BETWEEN 20000 AND 40000;

--query for using order by.
SELECT first_name, last_name, citizenship_number
FROM customers
ORDER BY citizenship_number;

--query for using group by.
SELECT COUNT(car_color), car_color
FROM customer_cars
GROUP BY car_color;

--query for inner join.
SELECT b.bill_number, m.mechanic_id, b.booking_date
FROM bookings b
INNER JOIN mechanics m ON b.mechanic_id = m.mechanic_id;

--query for outer join.
SELECT cc.c_citizenship_number, cc.vechical_number, cc.engine_number 
FROM customer_cars cc
FULL OUTER JOIN customers c
ON cc.c_citizenship_number = c.citizenship_number;

--complex query... 
SELECT c.first_name, c.address.street, c.address.city
FROM customers c
WHERE c.address.city IN(
	SELECT m.address.city
	FROM mechanics m
	WHERE m.address.country = 'UK');

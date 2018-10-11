-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

-- INSERTING VALUE INTO ADDRESSES TABLE
INSERT INTO addresses (street, city, country)
VALUES ('221 BAKER STREET', 'LONDON', 'UK');
INSERT INTO addresses (street, city, country)
VALUES ('641 FULHAM ROAD', 'LONDON', 'UK');
INSERT INTO addresses (street, city, country)
VALUES ('544 42ND STREET', 'NEW YORK', 'USA');
INSERT INTO addresses (street, city, country)
VALUES ('456 AVENUE CHAMPS', 'PARIS', 'FRANCE');
INSERT INTO addresses (street, city, country)
VALUES ('562 HOCKEY STREET', 'TORONTO', 'CANADA');

-- INSERTING VALUE INTO CAR MODELS TABLE
INSERT INTO car_models (engine_number, model, manufacturer, price)
VALUES ('111212789',  'i20', 'HONDA', 10000);
INSERT INTO car_models (engine_number, model, manufacturer, price)
VALUES ('111214526',  'BENZ-M3', 'MERCEDES', 30000);
INSERT INTO car_models (engine_number, model, manufacturer, price)
VALUES ('111212149',  'A4', 'AUDI', 40000);
INSERT INTO car_models (engine_number, model, manufacturer, price)
VALUES ('111212130',  'R8', 'AUDI', 45000);
INSERT INTO car_models (engine_number, model, manufacturer, price)
VALUES ('111212133',  'i10', 'HONDA', 20000);
INSERT INTO car_models (engine_number, model, manufacturer, price)
VALUES ('111212127',  'XING', 'HYUNDAI', 50000);

-- INSERTING VALUE INTO CUSTOMERS TABLE
INSERT INTO customers (citizenship_number, first_name, last_name)
VALUES ('CN5130', 'SANDRA', 'BULOCK');

UPDATE customers SET address = 
(select ref(a) FROM addresses a
WHERE a.street='641 FULHAM ROAD')
WHERE citizenship_number = 'CN5130';

INSERT INTO customers (citizenship_number, first_name, last_name)
VALUES ('CN5131', 'SACHIN', 'MANANDHER');

UPDATE customers SET address = 
(select ref(a) FROM addresses a
WHERE a.street='544 42ND STREET')
WHERE citizenship_number = 'CN5131';

INSERT INTO customers (citizenship_number, first_name, last_name)
VALUES ('CN5132', 'EDEN', 'HAZARD');

UPDATE customers SET address = 
(select ref(a) FROM addresses a
WHERE a.street='221 BAKER STREET')
WHERE citizenship_number = 'CN5132';

INSERT INTO customers (citizenship_number, first_name, last_name)
VALUES ('CN5133', 'FERNANDO', 'SUCRO');

UPDATE customers SET address = 
(select ref(a) FROM addresses a
WHERE a.street='456 AVENUE CHAMPS')
WHERE citizenship_number = 'CN5133';

INSERT INTO customers (citizenship_number, first_name, last_name)
VALUES ('CN5134', 'GRAHAM', 'NORTON');

UPDATE customers SET address = 
(select ref(a) FROM addresses a
WHERE a.street='221 BAKER STREET')
WHERE citizenship_number = 'CN5134';

INSERT INTO customers (citizenship_number, first_name, last_name)
VALUES ('CN5136', 'FRANK', 'JUNIOR');

UPDATE customers SET address = 
(select ref(a) FROM addresses a
WHERE a.street='456 AVENUE CHAMPS')
WHERE citizenship_number = 'CN5136';

-- INSERTING VALUE INTO CUSTOMER CARS TABLE
INSERT INTO customer_cars (vechical_number, engine_number, c_citizenship_number, car_color)
VALUES ('BA72PA-4575', '111212789', 'CN5130', 'BLUE');
INSERT INTO customer_cars (vechical_number, engine_number, c_citizenship_number, car_color)
VALUES ('BA65PA-279', '111214526', 'CN5131', 'BLACK');
INSERT INTO customer_cars (vechical_number, engine_number, c_citizenship_number, car_color)
VALUES ('BA74PA-8156', '111212149', 'CN5132', 'WHITE');
INSERT INTO customer_cars (vechical_number, engine_number, c_citizenship_number, car_color)
VALUES ('BA50PA-301', '111212130', 'CN5133', 'YELLOW');
INSERT INTO customer_cars (vechical_number, engine_number, c_citizenship_number, car_color)
VALUES ('BA50PA-302', '111212133', 'CN5134', 'RED');
INSERT INTO customer_cars (vechical_number, engine_number, c_citizenship_number, car_color)
VALUES ('BA50PA-303', '111212127', 'CN5136', 'BLUE');

-- INSERTING VALUE INTO MECHANICS TABLE
INSERT INTO mechanics (mechanic_id, first_name, last_name, address, specilization)
VALUES ('1001', 'SUJIN', 'MANANDHER', address_type('221 BAKER STREET', 'LONDON', 'UK'),
		specilization_varray_type (specilization_type ('ENGINE', 2, 1000)));
		
INSERT INTO mechanics (mechanic_id, first_name, last_name, address, specilization)
VALUES ('1002', 'DEEPAK', 'BASNET', address_type('562 HOCKEY STREET', 'TORONTO', 'CANADA'),
		specilization_varray_type (specilization_type ('WHEEL', 1, 200)));

INSERT INTO mechanics (mechanic_id, first_name, last_name, address, specilization)
VALUES ('1003', 'SURAJ', 'KHANAL', address_type('456 AVENUE CHAMPS', 'PARIS', 'FRANCE'),
		specilization_varray_type (specilization_type ('GENERAL', 3, 100)));	
		
	
-- INSERTING VALUE INTO BOOKING TABLE
INSERT INTO bookings
(bill_number, mechanic_id, booking_date, due_date, booking_item)
VALUES ('10001', '1001', '01-JAN-2017', '02-JAN-2017',
booking_item_table_type(
booking_item_type('NORTON','BA54PA-299', 'HONDA', 1300),
booking_item_type('BULOCK','BA72PA-4575', 'HONDA', 1300)));	

INSERT INTO bookings
(bill_number, mechanic_id, booking_date, due_date, booking_item)
VALUES ('10002', '1002', '04-JAN-2017', '06-JAN-2017',
booking_item_table_type(
booking_item_type('MANANDHER','BA65PA-279', 'MERCEDES', 1000),
booking_item_type('HAZARD','BA74PA-8156', 'AUDI', 1000)));

SHOW ERRORS;	



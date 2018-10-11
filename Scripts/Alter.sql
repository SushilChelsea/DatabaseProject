-- Local Drive Location
--@C:\Users\Sushil\Desktop\DatabaseProject\Alter.sql        

-- Author: Sushil Pun
--15/03/2017

--Creating PKs for table
ALTER TABLE customers
ADD CONSTRAINT pk_customers
PRIMARY KEY (citizenship_number);

ALTER TABLE car_models
ADD CONSTRAINT pk_engine_number
PRIMARY KEY (engine_number);

ALTER TABLE customer_cars
ADD CONSTRAINT pk_customer_cars
PRIMARY KEY (vechical_number, engine_number, c_citizenship_number);

ALTER TABLE mechanics
ADD CONSTRAINT pk_mechanics
PRIMARY KEY (mechanic_id);

ALTER TABLE bookings
ADD CONSTRAINT pk_bookings
PRIMARY KEY (bill_number);

--Creating FKs for table

ALTER TABLE customer_cars
ADD CONSTRAINT fk_cc_customers
FOREIGN KEY (C_citizenship_number)
REFERENCES customers(citizenship_number);

ALTER TABLE customer_cars
ADD CONSTRAINT fk_cc_car_models
FOREIGN KEY (engine_number)
REFERENCES car_models(engine_number);

ALTER TABLE bookings
ADD CONSTRAINT fk_b_mechanics
FOREIGN KEY (mechanic_id)
REFERENCES mechanics(mechanic_id);
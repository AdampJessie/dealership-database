-- -- -- -- -- -- -- ---- -- -- -- -- -- --
-- Clearing > Creating > Using Database  --
-- -- -- -- -- -- -- ---- -- -- -- -- -- --

DROP DATABASE IF EXISTS dealership;
CREATE DATABASE dealership;

USE dealership;

-- -- -- -- -- -- ---- -- -- -- -- -- --
--           Deleting tables          --
-- -- -- -- -- -- ---- -- -- -- -- -- --

DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS lease_contracts;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS dealerships;

-- -- -- -- -- -- ---- -- -- -- -- -- --
--          Creating tables           --
-- -- -- -- -- -- ---- -- -- -- -- -- --

CREATE TABLE vehicles(
  VIN varchar(17),
  make varchar(50) NOT NULL,
  model varchar(50) NOT NULL,
  vehicle_year int NOT NULL,
  SOLD boolean NOT NULL,
  color varchar(50) NOT NULL,
  vehicle_type varchar(50) NOT NULL,
  odometer int NOT NULL,
  price double NOT NULL,
  
  PRIMARY KEY (VIN)
);

CREATE TABLE sales_contracts(
  contract_id int AUTO_INCREMENT,
  VIN varchar(17) NOT NULL,
  sale_date date NOT NULL,
  price decimal(10,2) NOT NULL,
  
  PRIMARY KEY (contract_id),
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts(
  contract_id int AUTO_INCREMENT,
  VIN varchar(17) NOT NULL,
  lease_start date NOT NULL,
  lease_end date NOT NULL,
  monthly_payment decimal(10,2) NOT NULL,
  
  PRIMARY KEY (contract_id),
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE dealerships(
  dealership_id int AUTO_INCREMENT,
  dealership_name varchar(50) NOT NULL,
  address varchar(50) NOT NULL,
  phone varchar(12) NOT NULL,
  
  PRIMARY KEY (dealership_id)
);

CREATE TABLE inventory (
  dealership_id int,
  VIN varchar(17),
  
  FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
  FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
-- -- -- -- -- -- ---- -- -- -- -- -- --
--         Inserting sample data      --
-- -- -- -- -- -- ---- -- -- -- -- -- --

INSERT INTO vehicles (VIN, make, model, vehicle_year, SOLD, color, vehicle_type, odometer, price)
VALUES ("10112", "Ford", "Explorer", 1993, FALSE, "Red", "SUV", 525123, 995.00);

INSERT INTO vehicles (VIN, make, model, vehicle_year, SOLD, color, vehicle_type, odometer, price)
VALUES ("37846", "Ford", "Ranger", 2001, TRUE, "Yellow", "Truck", 172544, 1995.00);

INSERT INTO vehicles (VIN, make, model, vehicle_year, SOLD, color, vehicle_type, odometer, price)
VALUES ("44901", "Honda", "Civic", 2012, TRUE, "Gray", "SUV", 103221, 6995.00);

INSERT INTO vehicles (VIN, make, model, vehicle_year, SOLD, color, vehicle_type, odometer, price)
VALUES ("11111", "Dodge", "Charger", 2007, FALSE, "Black", "Muscle", 50000, 4000.00);

INSERT INTO vehicles (VIN, make, model, vehicle_year, SOLD, color, vehicle_type, odometer, price)
VALUES ("11110", "Dodge", "Challenger", 2009, FALSE, "Red", "Muscle", 30000, 6000.00);

-- -- -- -- -- -- ---- -- -- -- -- -- --

INSERT INTO dealerships (dealership_name, address, phone)
VALUES ("EUREKA!", "123 Rickety St, Blighttown, NY 10345", "213-645-7098");

INSERT INTO dealerships (dealership_name, address, phone)
VALUES ("BAH HUMBUG!", "321 Tickety St, Brighttown, FL 30415", "123-456-7890");

-- -- -- -- -- -- ---- -- -- -- -- -- --

INSERT INTO sales_contracts (VIN, sale_date, price)
VALUES ("44901", '2020-01-01', 6995.00);

INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment)
VALUES ("37846", '2020-01-01', '2020-12-01' , 139.65);

-- -- -- -- -- -- ---- -- -- -- -- -- --

INSERT INTO inventory (dealership_id, VIN)
VALUES (1, 10112);

INSERT INTO inventory (dealership_id, VIN)
VALUES (1, 11110);

INSERT INTO inventory (dealership_id, VIN)
VALUES (2, 11111);

INSERT INTO inventory (dealership_id, VIN)
VALUES (2, 37846);

INSERT INTO inventory (dealership_id, VIN)
VALUES (2, 44901);



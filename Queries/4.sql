-- Find the dealership where a certain car is located, by VIN

SELECT *
FROM dealerships
WHERE dealership_id = (SELECT dealership_id FROM inventory WHERE VIN = 11110)
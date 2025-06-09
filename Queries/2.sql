-- Find all vehicles for a specific dealership

SELECT *
FROM Vehicles
WHERE VIN IN (SELECT VIN FROM inventory WHERE dealership_id = 1)


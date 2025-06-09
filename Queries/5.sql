-- Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)

SELECT dealership_name AS Dealership
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN in (SELECT VIN FROM Vehicles WHERE vehicle_type = 'Truck')
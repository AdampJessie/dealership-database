-- Get all sales information for a specific dealer for a specific date range

SELECT * 
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
WHERE (sale_date >= '2020-01-01' AND sale_date <= '2020-01-01') AND
dealership_id in (SELECT dealership_id FROM dealerships WHERE dealership_name LIKE 'BAH HUMBUG!')
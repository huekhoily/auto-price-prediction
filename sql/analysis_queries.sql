-- AutoPrice: Used Car SQL Analysis
-- This file contains SQL queries used to analyze pricing,
-- vehicle characteristics, and listing patterns.

-- Q1. Which brands have the most listings?

SELECT 
	brand,
	COUNT(*) as n_cars
FROM cars
GROUP BY brand
ORDER BY n_cars DESC
LIMIT 10;

-- Q2. Which fuel types have the highest average price?
-- Only groups with at least 30 listings are included
-- to reduce the influence of very small samples.

SELECT
	fuel_type,
	COUNT(*) AS n_cars,
    ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY fuel_type
HAVING COUNT(*) >= 30
ORDER BY average_price DESC;

-- Q3. How does accident history relate to price?

SELECT 
	accident,
	COUNT(*) AS n_cars,
	ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY accident
ORDER BY average_price DESC;

-- Q4. How do transmission groups compare in price?
-- Only groups with at least 50 listings are kept
-- to reduce the influence of very small samples.

SELECT
	transmission_group,
	COUNT(*) AS n_cars,
	ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY transmission_group
HAVING COUNT(*) >= 50
ORDER BY average_price DESC;

-- Q5. Which brands have the highest average listed price among newer cars?
-- Only vehicles from 2020 or newer are considered.
-- Brands must have at least 20 listings.

SELECT
	brand,
	COUNT(*) AS n_cars,
	ROUND(AVG(price), 2) AS average_price
FROM cars
WHERE model_year >= 2020
GROUP BY brand
HAVING COUNT(*) >= 20
ORDER BY average_price DESC;

-- Q6. Which newer vehicles have unusually high mileage?

SELECT brand, model, model_year, mileage, price
FROM cars
WHERE model_year >= 2020
AND mileage >= 100000
ORDER BY mileage DESC
LIMIT 15;

-- Q7. Which recent low-mileage vehicles fall within an affordable price range?

SELECT brand, model, model_year, mileage, price
FROM cars
WHERE model_year >= 2020
AND mileage <30000
AND price BETWEEN 20000 AND 40000
ORDER BY price ASC
LIMIT 15;


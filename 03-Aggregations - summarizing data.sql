SELECT COUNT(*) -- Count the total number of customers
FROM customers
WHERE date_of_birth BETWEEN '1980-01-01' AND '1989-12-31'; -- Select customers born between 1980-01-01 and 1989-12-31


SELECT COUNT(*)   -- Count the total number of customers
FROM customers
WHERE country = 'Germany'; -- Select all customers from Germany


SELECT COUNT(DISTINCT country)   -- Count the number of countries
FROM customers;


SELECT MIN(rating) AS min_rating, -- Calculate the minimum rating and use alias min_rating
	   MAX(rating) AS max_rating, -- Calculate the maximum rating and use alias max_rating
	   AVG(rating) AS avg_rating, -- Calculate the average rating and use alias avg_rating
	   COUNT(rating) AS number_ratings -- Count the number of ratings and use alias number_ratings
FROM renting
WHERE movie_id = '25'; -- Select all records of the movie with ID 25


SELECT * -- Select all records of movie rentals since January 1st 2019
FROM renting
WHERE date_renting >= '2019-01-01';


SELECT 
	COUNT(*), -- Count the total number of rented movies
	AVG(rating) -- Add the average rating
FROM renting
WHERE date_renting >= '2019-01-01';


SELECT 
	COUNT(*) AS number_renting, -- Give it the column name number_renting
	AVG(rating) average_rating  -- Give it the column name average_rating
FROM renting
WHERE date_renting >= '2019-01-01';


SELECT 
	COUNT(*) AS number_renting,
	AVG(rating) AS average_rating, 
    SUM(rating) AS number_ratings -- Add the total number of ratings here.
FROM renting
WHERE date_renting >= '2019-01-01';

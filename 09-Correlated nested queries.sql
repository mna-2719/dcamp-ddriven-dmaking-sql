-- Count movie rentals of customer 45
SELECT COUNT(*)
FROM renting AS r
WHERE r.customer_id = 45;


-- Select customers with less than 5 movie rentals
SELECT *
FROM customers AS c
WHERE 5 > 
	(SELECT count(*)
	FROM renting AS r
	WHERE r.customer_id = c.customer_id);


-- Calculate the minimum rating of customer with ID 7
SELECT MIN(rating)
FROM renting AS r
WHERE r.customer_id = 7;


SELECT *
FROM customers AS c
WHERE 4 > -- Select all customers with a minimum rating smaller than 4 
	(SELECT MIN(rating)
	FROM renting AS r
	WHERE r.customer_id = c.customer_id);


SELECT *
FROM movies AS m
WHERE 5 < -- Select all movies with more than 5 ratings
	(SELECT COUNT(rating)
	FROM renting AS r
	WHERE r.movie_id = m.movie_id);


SELECT *
FROM movies AS m
WHERE 8 < -- Select all movies with an average rating higher than 8
	(SELECT AVG(rating)
	FROM renting AS r
	WHERE r.movie_id = m.movie_id);



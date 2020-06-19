SELECT country, -- Extract information of a pivot table of gender and country for the number of customers
	   gender,
	   COUNT(*)
FROM customers
GROUP BY CUBE (gender, country)
ORDER BY country;


SELECT genre,
       year_of_release	,
       COUNT(*)
FROM movies
GROUP BY CUBE (genre, year_of_release)
ORDER BY year_of_release;


-- Augment the records of movie rentals with information about movies and customers
SELECT *
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id;


-- Calculate the average rating for each country
SELECT 
	c.country,
    AVG(r.rating)
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY c.country;


SELECT 
	c.country, 
	m.genre, 
	AVG(r.rating) AS avg_rating -- Calculate the average rating 
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY CUBE (m.genre, c.country); -- For all aggregation levels of country and genre



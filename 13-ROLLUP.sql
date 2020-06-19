-- Count the total number of customers, the number of customers for each country, and the number of female and male customers for each country
SELECT country,
       gender,
	   COUNT(*)
FROM customers
GROUP BY ROLLUP (country, gender)
ORDER BY country, gender; -- Order the result by country and gender


-- Join the tables
SELECT *
FROM renting AS r
LEFT JOIN movies AS m
ON r.movie_id = m.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id;


SELECT 
	c.country, -- Select country
	m.genre, -- Select genre
	AVG(r.rating), -- Average ratings
	COUNT(*)  -- Count number of movie rentals
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY (country, genre) -- Aggregate for each country and each genre
ORDER BY c.country, m.genre;


-- Group by each county and genre with OLAP extension
SELECT 
	c.country, 
	m.genre, 
	AVG(r.rating) AS avg_rating, 
	COUNT(*) AS num_rating
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY ROLLUP (country, genre)
ORDER BY c.country, m.genre;



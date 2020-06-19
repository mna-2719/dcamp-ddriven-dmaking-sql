SELECT *
FROM renting AS r
LEFT JOIN customers AS c   -- Add customer information
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m   -- Add movie information
ON m.movie_id = r.movie_id;


SELECT *
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE date_of_birth BETWEEN '1970-01-01' AND '1979-12-31'; -- Select customers born in the 70s


SELECT m.title, 
COUNT(*), -- Report number of views per movie
AVG(r.rating) -- Add the average rating for each movie
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE c.date_of_birth BETWEEN '1970-01-01' AND '1979-12-31'
GROUP BY m.title;


SELECT m.title, 
COUNT(*),
AVG(r.rating)
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE c.date_of_birth BETWEEN '1970-01-01' AND '1979-12-31'
GROUP BY m.title
HAVING COUNT(*) > 1 -- Remove movies with only one rental
ORDER BY AVG(r.rating); -- Order with highest rating first


SELECT *
FROM renting as r 
LEFT JOIN customers AS c  -- Augment table renting with information about customers 
ON r.customer_id = c.customer_id
LEFT JOIN actsin AS ai  -- Augment the table renting with the table actsin
ON r.movie_id = ai.movie_id 
LEFT JOIN actors AS a  -- Augment table renting with information about actors
ON ai.actor_id = a.actor_id;


SELECT a.name,  c.gender,
       COUNT(*) AS number_views, 
       AVG(r.rating) AS avg_rating
FROM renting as r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
LEFT JOIN actsin as ai
ON r.movie_id = ai.movie_id
LEFT JOIN actors as a
ON ai.actor_id = a.actor_id
GROUP BY a.name, c.gender -- For each actor, separately for male and female customers
HAVING AVG(r.rating) IS NOT NULL 
AND COUNT(*) > 5 -- Report only actors with more than 5 movie rentals
ORDER BY avg_rating DESC, number_views DESC;


SELECT a.name,  c.gender,
       COUNT(*) AS number_views, 
       AVG(r.rating) AS avg_rating
FROM renting as r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
LEFT JOIN actsin as ai
ON r.movie_id = ai.movie_id
LEFT JOIN actors as a
ON ai.actor_id = a.actor_id
WHERE country ='Spain' -- Select only customers from Spain
GROUP BY a.name, c.gender
HAVING AVG(r.rating) IS NOT NULL 
  AND COUNT(*) > 5 
ORDER BY avg_rating DESC, number_views DESC;


SELECT *
FROM renting AS r -- Augment the table renting with information about customers
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
LEFT JOIN movies AS m -- Augment the table renting with information about movies
ON r.movie_id = m.movie_id
WHERE date_renting >= '2019-01-01'; -- Select only records about rentals since the beginning of 2019


SELECT 
	c.country,                    -- For each country report
	COUNT(r.movie_id) AS number_renting, -- The number of movie rentals
	AVG(r.rating) AS average_rating, -- The average rating
	SUM(renting_price) AS revenue         -- The revenue from movie rentals
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE date_renting >= '2019-01-01'
GROUP BY c.country;

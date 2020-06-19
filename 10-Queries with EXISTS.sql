-- Select all records of movie rentals from customer with ID 115
SELECT *
FROM renting
WHERE r.customer_id = 115;


SELECT *
FROM renting
WHERE rating IS NOT NULL -- Exclude those with null ratings
AND customer_id = 115;


SELECT *
FROM renting
WHERE rating IS NOT NULL -- Exclude null ratings
AND customer_id = 1; -- Select all ratings from customer with ID 1


SELECT *
FROM customers AS c -- Select all customers with at least one rating
WHERE EXISTS 
	(SELECT *
	FROM renting AS r
	WHERE rating IS NOT NULL 
	AND r.customer_id = c.customer_id);


SELECT *  -- Select the records of all actors who play in a Comedy
FROM actsin AS ai
LEFT JOIN movies AS m
ON ai.movie_id = m.movie_id
WHERE m.genre = 'Comedy';


SELECT *
FROM actsin AS ai
LEFT JOIN movies AS m
ON m.movie_id = ai.movie_id
WHERE m.genre = 'Comedy'
AND ai.actor_id = 1; -- Select only the actor with ID 1


SELECT *
FROM actors AS a
WHERE EXISTS
	(SELECT *
	 FROM actsin AS ai
	 LEFT JOIN movies AS m
	 ON m.movie_id = ai.movie_id
	 WHERE m.genre = 'Comedy'
	 AND ai.actor_id = a.actor_id);


SELECT a.nationality, COUNT(*) -- Report the nationality and the number of actors for each nationality
FROM actors AS a
WHERE EXISTS
	(SELECT ai.actor_id
	 FROM actsin AS ai
	 LEFT JOIN movies AS m
	 ON m.movie_id = ai.movie_id
	 WHERE m.genre = 'Comedy'
	 AND ai.actor_id = a.actor_id)
GROUP BY a.nationality;

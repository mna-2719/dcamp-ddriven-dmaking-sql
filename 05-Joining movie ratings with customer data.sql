SELECT * -- Join renting with customers
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id;


SELECT *
FROM renting AS r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
WHERE country = 'Belgium'; -- Select only records from customers coming from Belgium


SELECT AVG(rating) -- Average ratings of customers from Belgium
FROM renting AS r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
WHERE c.country='Belgium';


SELECT *
FROM renting AS r
LEFT JOIN movies AS m -- Choose the correct join statment
ON r.movie_id = m.movie_id;


SELECT 
	SUM(m.renting_price), -- Get the revenue from movie rentals
	COUNT(*), -- Count the number of rentals
	COUNT(DISTINCT customer_id)  -- Count the number of customers
FROM renting AS r
LEFT JOIN movies AS m
ON r.movie_id = m.movie_id;


SELECT 
	SUM(m.renting_price), 
	COUNT(*), 
	COUNT(DISTINCT r.customer_id)
FROM renting AS r
LEFT JOIN movies AS m
ON r.movie_id = m.movie_id
-- Only look at movie rentals in 2018
WHERE date_renting BETWEEN '2018-01-01' AND '2018-12-31';


SELECT DISTINCT a.name, -- Create a list of movie titles and actor names
       m.title
FROM actsin AS ai
LEFT JOIN movies AS m
ON m.movie_id = ai.movie_id
LEFT JOIN actors AS a
ON a.actor_id = ai.actor_id;

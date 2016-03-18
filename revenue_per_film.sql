# Revenue Per Film
SELECT
	f.film_id,
	f.title,
	f.rental_rate * COUNT(*) total_revenue
FROM
	rental r, 
	film f,
	inventory	i
WHERE
	r.inventory_id = i.inventory_id
	AND i.film_id = f.film_id
GROUP BY 1
;
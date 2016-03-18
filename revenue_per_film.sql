# Revenue Per Film
DROP TEMPORARY TABLE IF EXISTS revenue_per_film;
CREATE TEMPORARY TABLE revenue_per_film
SELECT
	f.film_id,
	f.title,
	f.rental_rate * COUNT(*) total_revenue
FROM
	rental r, 
	film f,
	inventory	 i
WHERE
	r.inventory_id = i.inventory_id
	AND i.film_id = f.film_id
GROUP BY 1
;


SELECT 
	a.actor_id,
	CONCAT(a.first_name, " ", a.last_name) name,
	SUM(rpf.total_revenue) total_revenue_per_actor
FROM
	revenue_per_film rpf,
	actor a,
	film_actor fa
WHERE
	rpf.film_id = fa.film_id
	AND a.actor_id = fa.actor_id
GROUP BY 1
ORDER BY total_revenue_per_actor DESC
LIMIT 10
;	
# Cohort Analysis

# Customer's First Rental
DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental
SELECT
    r.customer_id,
    MIN(r.rental_date) first_time
FROM
    rental r
GROUP BY 1
;
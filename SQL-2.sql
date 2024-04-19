SELECT staff.first_name, staff.last_name, city.city, COUNT(customer.customer_id) AS count_of_customers
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN address ON store.address_id = address.address_id
JOIN customer ON store.store_id = customer.store_id
JOIN city ON address.city_id = city.city_id
GROUP BY staff.first_name, staff.last_name, city.city
HAVING COUNT(customer.customer_id) > 300;


SELECT COUNT(*) AS count_of_films
FROM film
WHERE length > (SELECT AVG(length) FROM film);


SELECT
    DATE_FORMAT(payment.payment_date, '%Y-%m') AS month,
    SUM(payment.amount) AS sum_of_payment,
    COUNT(rental.rental_id) AS count_of_rental
FROM
    payment
JOIN
    rental ON payment.rental_id = rental.rental_id
GROUP BY
    month
ORDER BY
    sum_of_payment DESC
LIMIT 1;


SELECT	val.count_of_payments count_of_payments,
		val.staff_id,
		CASE 
			WHEN val.count_of_payments> 8000 THEN 'Yes'
			ELSE 'No'
		END AS premia
FROM (	SELECT	COUNT(payment_id) 'count_of_payments',
				staff_id  
  		FROM	sakila.payment 
  		GROUP BY staff_id ) val;


SELECT	film.title AS '0 rental'
FROM	sakila.rental
RIGHT JOIN	sakila.inventory ON inventory.inventory_id = rental.inventory_id  
RIGHT JOIN	sakila.film ON film.film_id = inventory.film_id 
WHERE	rental.rental_id IS NULL;



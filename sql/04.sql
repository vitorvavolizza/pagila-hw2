/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

select
f.title
from film f
where exists (
    select 1
    from inventory i
    inner join rental r on i.inventory_id = r.inventory_id
    where i.film_id = f.film_id and r.customer_id = 1
    group by i.film_id
    having count(r.rental_id) > 1)
order by f.title;


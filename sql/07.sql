/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 07b you will use the LEFT JOIN clause.
 *
 * NOTE:
 * This is the last problem that will require you to use a particular method to solve the query.
 * In future problems, you may choose whether to use the LEFT JOIN or NOT IN clause if they are more applicable.
 */

select
f.title as title
from film f
where f.film_id not in (
    select distinct i.film_id
    from inventory i
    join rental r on i.inventory_id = r.inventory_id
    join customer c on r.customer_id = c.customer_id
    join address a on c.address_id = a.address_id
    join city ci on a.city_id = ci.city_id
    where ci.country_id = 103)
and exists (
    select 1
    from inventory i2
    where f.film_id = i2.film_id)
order by f.title;


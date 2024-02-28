/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */


select
f.title as title
from film f
join inventory i on f.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id
left join customer c on r.customer_id = c.customer_id
left join address a on c.address_id = a.address_id
left join city ci on a.city_id = ci.city_id
group by f.title
having count(case when ci.country_id = 103 then 1 end) = 0
order by title;


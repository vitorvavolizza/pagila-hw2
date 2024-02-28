/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select actor.last_name as last_name, actor.first_name as first_name
from actor
left join customer on actor.first_name = customer.first_name and actor.last_name = customer.last_name
where customer.customer_id is null
order by last_name, first_name;


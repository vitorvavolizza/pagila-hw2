/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

select distinct
a.first_name || ' ' || a.last_name as "Actor Name"
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
where exists (
    select 1
    from unnest(f.special_features) as feature
    where feature = 'Behind the Scenes'
)
order by "Actor Name";


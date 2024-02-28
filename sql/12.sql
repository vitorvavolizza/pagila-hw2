/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */


select
f.title
from film f
where exists (
    select 1
    from unnest(f.special_features) as feature
    where feature = 'Behind the Scenes'
) and exists (
    select 1
    from unnest(f.special_features) as feature
    where feature = 'Trailers'
)
order by f.title;


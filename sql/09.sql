/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

select
unnest(special_features) special_features,
count(*)
from film
group by unnest(special_features)
order by unnest(special_features);


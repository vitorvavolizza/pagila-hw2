/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */

select rank, title, revenue, "total revenue",
to_char(100 * "total revenue" / (
    select sum(amount)
    from film
    left join inventory using (film_id)
    left join rental using (inventory_id)
    left join payment using (rental_id)
), 'FM999.99') as "percent revenue"
from ( select rank() over ( order by sum(case when amount is null then 0.00 else amount end) desc ) as rank,
    film.title as title,
    sum(case when amount is null then 0.00 else amount end) as revenue,
    sum(sum(case when amount is null then 0.00 else amount end)) over (order by sum(case when amount is null then 0.00 else amount end) desc) as "total revenue"
    from film
    left join inventory using (film_id)
    left join rental using (inventory_id)
    left join payment using (rental_id)
    group by film.title
) as seventeen
order by rank;

/*
 * Compute the total revenue for each film.
 * The output should include a new column "rank" that shows the numerical rank
 *
 * HINT:
 * You should use the `rank` window function to complete this task.
 * Window functions are conceptually simple,
 * but have an unfortunately clunky syntax.
 * You can find examples of how to use the `rank` function at
 * <https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/>.
 */

select
rank() over (
    order by sum(coalesce(amount, 0.00)) desc
) as rank,
film.title as title,
sum(coalesce(amount, 0.00)) as revenue
from film
left join inventory using (film_id)
left join rental using (inventory_id)
left join payment using (rental_id)
group by film.title
order by revenue desc;


/*
 * Use a subquery to select the film_id and title columns
 * for all films whose rental_rate is greater than the average.
 * Use the film table and order by title.
 *
 * HINT:
 * The following tutorial has a solution for this problem:
 * https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-correlated-subquery/
 */

select film_id, title from film
where rental_rate > (select avg(rental_rate) from film)
order by title;

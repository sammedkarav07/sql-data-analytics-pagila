
--1
select first_name, last_name, email 
from customer
where activebool is true;

--2
select first_name, last_name, customer_id
from customer
order by customer_id desc
limit 10;

--3
select title, rental_rate 
from film
where rental_rate > 4.00
order by rental_rate desc;

--4
select avg(rental_rate) from film; 

--5
select rating, count(film_id) 
from film
group by rating 
order by count(film_id) desc;

--6
select title, film.length
from film
order by film.length desc
limit 5;

--7
select sum(amount) from payment;

--8
select min(rental_rate), max(rental_rate), avg(rental_rate)
from film;

--9
select store_id, count(customer_id)
from customer
group by store_id
order by  count(customer_id) desc;

--10
select rating, avg(rental_rate)
from film
group by rating
order by avg(rental_rate) desc;

--11
select customer_id,
       sum(amount)
from payment
group by customer_id
order by sum(amount) desc;

--12
select customer_id, 
       count(rental_id)
from rental
group by customer_id
order by count(rental_id) desc;

--13
select staff_id, 
       count(rental_id)
from rental
group by staff_id
order by count(rental_id) desc;

--14
select customer_id, 
       count(rental_id)
from rental
group by customer_id
having count(rental_id) > 25
order by count(rental_id) desc;

--15
select customer_id,
       avg(amount)
from payment
group by customer_id
order by avg(amount) desc;

--16
select staff_id, 
       sum(amount) as total_revenue
from payment
group by staff_id
order by sum(amount) desc;

--17
select rating,
       count(film_id)
from film
group by rating
having count(film_id) > 200
order by count(film_id) desc;

--18
select payment_date::date as payment_day,
       sum(amount)
from payment
group by payment_date::date
order by sum(amount) desc;

--19
select staff_id, min(amount), max(amount), avg(amount)
from payment
group by staff_id
order by avg(amount) desc;

--20
select customer_id, sum(amount) as total_payment
from payment
group by customer_id
having sum(amount) > 150
order by sum(amount) desc;

--21
select first_name, 
       last_name,
	   count(rental.rental_id) as no_of_rentals
from customer
left join rental on customer.customer_id = rental.customer_id
group by customer.customer_id, customer.first_name, customer.last_name
order by no_of_rentals desc;

--22
SELECT film.title,
       COUNT(rental.rental_id) AS no_of_rentals
FROM film
INNER JOIN inventory
    ON film.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id, film.title
ORDER BY no_of_rentals DESC;

--23
select first_name,
       last_name,
	   sum(payment.amount)
from customer
left join payment on customer.customer_id = payment.customer_id
group by customer.customer_id
order by sum(payment.amount) desc;

--24
select first_name,
	   sum(payment.amount)
from staff
left join payment on staff.staff_id = payment.staff_id
group by staff.staff_id
order by sum(payment.amount) desc;

--25
select category.name,
       count(film.film_id)
from category
left join film_category on category.category_id = film_category.category_id
left join film on film_category.film_id = film.film_id
group by category.name
order by count(film.film_id) desc;

--26
select first_name,
       last_name,
	   count(film.film_id)
from actor
inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id
group by actor.first_name, actor.last_name
order by count(film.film_id) desc;

--27
select film.title, category.name
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
order by category.name, film.title;

--28
select first_name,
       last_name,
	   count(payment.payment_id)
from customer
left join payment on customer.customer_id = payment.customer_id
group by first_name, last_name
order by count(payment.payment_id) desc;

--29
select first_name, 
	   count(rental.rental_id)
from staff
left join rental on staff.staff_id = rental.staff_id
group by staff.first_name
order by count(rental.rental_id) desc;

--30
SELECT customer.first_name,
       customer.last_name,
       COUNT(DISTINCT film.film_id) AS different_films
FROM customer
LEFT JOIN rental
    ON customer.customer_id = rental.customer_id
LEFT JOIN inventory
    ON rental.inventory_id = inventory.inventory_id
LEFT JOIN film
    ON inventory.film_id = film.film_id
GROUP BY customer.customer_id,
         customer.first_name,
         customer.last_name
ORDER BY different_films DESC;

--31
select title,
       sum(payment.amount) as revenue
from film
left join inventory 
       on film.film_id = inventory.film_id
left join rental 
       on inventory.inventory_id = rental.inventory_id
left join payment 
       on rental.rental_id = payment.rental_id
group by title
having sum(payment.amount) is not null
order by sum(payment.amount) desc;

--32
select first_name,
       last_name,
	   sum(payment.amount)
from customer
left join rental on customer.customer_id = rental.customer_id
left join payment on rental.rental_id= payment.rental_id
group by customer.first_name, customer.last_name
order by sum(payment.amount) desc;

--33
select category.name,
       sum(payment.amount)
from category
left join film_category on category.category_id = film_category.category_id
left join film on film_category.film_id = film.film_id
left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id
left join payment on rental.rental_id = payment.rental_id
group by category.name
order by sum(payment.amount) desc;

--34
select first_name,
       last_name,
	   sum(payment.amount)
from actor
left join film_actor on actor.actor_id = film_actor.actor_id
left join film on film_actor.film_id = film.film_id
left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id
left join payment on rental.rental_id = payment.rental_id
group by first_name, last_name
order by sum(payment.amount) desc;

--35
select category.name,
       count(rental.rental_id)
from category
left join film_category on category.category_id = film_category.category_id
left join film on film_category.film_id = film.film_id
left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id
group by category.name
order by count(rental.rental_id) desc;

--36
select first_name,
       last_name,
	   count(distinct film_category.category_id)
from customer
left join rental on customer.customer_id = rental.customer_id
left join inventory on rental.inventory_id = inventory.inventory_id
left join film on inventory.film_id = film.film_id
left join film_category on film.film_id = film_category.film_id
group by customer.first_name, customer.last_name
order by count(distinct film_category.category_id) desc;

--37
select title, count(film_actor.actor_id) from film
left join film_actor on film.film_id = film_actor.film_id
group by title
having count(film_actor.actor_id) is not null
order by count (film_actor.actor_id) desc;

--38
select first_name,
       last_name,
	   count(distinct film_category.category_id)
from actor
left join film_actor on actor.actor_id = film_actor.actor_id
left join film on film_actor.film_id = film.film_id
left join film_category on film.film_id = film_category.film_id
group by first_name, last_name
order by count(distinct film_category.category_id) desc;

--39
select store.store_id,
       count(distinct customer_id)
from store
left join customer on store.store_id = customer.store_id
group by store.store_id
order by count(distinct customer_id) desc;

--40
select language.name,
       count(distinct film.film_id)
from language
left join film on language.language_id = film.language_id
group by language.name
order by count(distinct film.film_id) desc;

--41
select title, 
       rental_rate,
	   case when rental_rate < 1.00 then 'Low'
	        when rental_rate between 1.00 and 3.00 then 'Medium'
			else 'High'
			end as rate_category
from film
order by rental_rate desc;

--42
select first_name,
       last_name,
	   sum(payment.amount) as total_payment,
	   case 
	        when sum(payment.amount) < 50 then 'Low'
	        when sum(payment.amount) between 50 and 100 then 'Medium'
			else 'High'
			end as payment_category
from customer
left join payment on customer.customer_id = payment.customer_id
group by customer.first_name, customer.last_name
order by sum(payment.amount) desc;

--43
select title,
        rental_duration,
		case when rental_duration <= 3 then 'Short'
		     when rental_duration between 4 and 5 then 'Medium'
			 else 'Long'
			 end as rental_duration_category
from film
order by rental_duration desc;

--44
select first_name, 
       last_name,
	   sum(payment.amount) as total_revenue,
	   case when sum(payment.amount) < 3000 then 'Low'
	        when sum(payment.amount) between 3000 and 3500 then 'Medium'
			else 'High'
			end as revenue_category
from staff
left join payment on staff.staff_id = payment.staff_id
group by first_name, last_name
order by total_revenue desc;

--45
select title, 
       film.length,
	   case 
	        when film.length < 90 then 'short'
	        when film.length between 90 and 120 then 'Medium'
			else 'Long'
			end as "length.category"
from film
order by film.length desc;

--46
select first_name,
        last_name,
		count(rental.rental_id),
		case when count(rental.rental_id) < 20 then 'Low'
		     when count(rental.rental_id) between 20 and 30 then 'Medium'
			 else 'High'
			 end as rental_category
from customer
left join rental on customer.customer_id = rental.customer_id
group by first_name, last_name
order by count(rental.rental_id) desc;

--47
select rating,
       avg(rental_rate) as average_rental_rate,
	   case when avg(rental_rate) < 2.50 then 'Low'
	        when avg (rental_rate) between 2.50 and 3.00 then 'medium'
			else 'High'
			end as rate_category
from film 
group by rating
order by avg(rental_rate) desc;

--48
select category.name,
       count(film_category.film_id) as number_of_films,
	   case when count(film_category.film_id) < 50 then 'small'
	        when count(film_category.film_id) between 50 and 70 then 'Medium'
			else 'Larg'
			end as category_size
from category
left join film_category on category.category_id = film_category.category_id
group by category.name
order by count(film_category.film_id) desc;

--49
select store.store_id,
       count(customer.customer_id) as number_of_customers,
	   case when count(customer.customer_id) < 300 then 'small'
	        when count(customer.customer_id) between 300 and 305 then 'medium'
			else 'Large'
			end as store_sie
from store
left join customer on store.store_id = customer.store_id
group by store.store_id
order by count(customer.customer_id) desc;

--50
select title,
       replacement_cost,
	   case when replacement_cost < 15 then 'Low'
	        when replacement_cost between 15 and 25 then 'Medium'
			else 'High'
			end as cost_category
from film
order by replacement_cost desc;

--51
select p.customer_id,
       sum(p.amount) as total_payment
from payment as p
group by customer_id
having sum(p.amount) > (
                        select avg(total_payment) 
						from (
                              select customer_id,
		                      sum(amount) as total_payment
							  from payment
							  group by customer_id
							 ) as customer_totals
						)								
order by total_payment desc;	

--52
select p.title,
       p.rental_rate
from film as p
where p.rental_rate > (
                        select max(rental_rate)
						from(
					         select rental_rate,
							        rating
					         from film
						     where rating = 'PG-13'
					       ) as PG_13_rental_rate
					  )	   
order by p.rental_rate desc;

--53
select r.customer_id,
       count(rental_id) as NO_of_rentals
from rental as r
group by r.customer_id
having count(rental_id) > (
                          select avg(NO_of_rentals)
						  from (
						        select customer_id,
								       count(rental_id) as NO_of_rentals
							    from rental
								group by customer_id
						  ) as avg_rental_per_customers
                       )
order by count(rental_id) desc;

--54
select f.title,
       f.rating, 
	   f.rental_rate
from film as f
where rental_rate > ( select avg(f2.rental_rate)
					  from film as f2
					 where f2.rating = f.rating
					  group by rating
					 )
order by rental_rate desc;

--55 
select customer_id,
       sum(amount) as total_payment
from payment
group by customer_id
having sum(amount) > (
                      select max(total_payment)
					  from(
                           select customer_id,
						          sum(amount) as total_payment
						   from payment
						   left join staff on payment.staff_id = staff.staff_id
						   group by customer_id, staff.store_id
						   having store_id = 1
					  ) as total_payment_form_store1
                   )
order by sum(amount) desc;

--56
SELECT f.title,
       f.rental_rate,
       f.replacement_cost
FROM film AS f
WHERE f.rental_rate > (
    SELECT AVG(f2.rental_rate)
    FROM film AS f2
    WHERE
        CASE
            WHEN f2.replacement_cost < 15 THEN 'Low'
            WHEN f2.replacement_cost BETWEEN 15 AND 25 THEN 'Medium'
            ELSE 'High'
        END
        =
        CASE
            WHEN f.replacement_cost < 15 THEN 'Low'
            WHEN f.replacement_cost BETWEEN 15 AND 25 THEN 'Medium'
            ELSE 'High'
        END
)
ORDER BY f.rental_rate DESC;

--57A
select customer_id,
       sum(amount) as total_payment
from payment
group by customer_id
having sum(amount) > ( 
                       select avg(total_payment)
                       from(
					        select customer_id, 
					               sum(amount) as total_payment
                            from payment
					        group by customer_id
						   ) as customer_total
					  )
order by sum(amount) desc;   
--57B
select customer_id,
       sum(amount) as total_payment
from payment
group by customer_id
having sum(amount) > (select avg(amount)
					  from payment)
order by sum(amount) desc;

--58
SELECT customer_id,
       payment_id,
       amount
FROM payment AS p
WHERE amount > (
    SELECT AVG(p2.amount)
    FROM payment AS p2
    WHERE p2.customer_id = p.customer_id
)
ORDER BY amount DESC;

--59
select title,
       rental_rate 
from film
where rental_rate > ( select max(total_rent)
                      from (
                             select avg(rental_rate) as total_rent
							 from film
					       ) as higest_avg_rental_rate
					)	  
order by rental_rate desc;

--60
select customer_id,
       sum(amount) as total_payment
from payment
group by customer_id
having sum(amount) > (
                      select max(total_payment)
					  from(
                           select payment.customer_id,
						          sum(payment.amount) as total_payment
						   from payment
						   left join staff on payment.staff_id = staff.staff_id
						   group by customer_id, staff.store_id
						   having staff.store_id = 2
					  ) as total_payment_form_store2
                   )
order by sum(amount) desc;

--61
select extract(year from payment_date) as years,
       extract(month from payment_date) as months,
	   sum(amount) as total_payment
from payment
group by extract(year from payment_date),
       extract(month from payment_date) 
order by years, months desc;

--62
select extract(dow from payment_date) as day_of_week,
       sum(amount) as total_payment
from payment
group by extract(dow from payment_date)
order by sum(amount) desc;
       

--63
select extract(year from payment_date) as years,
       sum(amount) as total_payment
from payment
group by extract(year from payment_date)
order by years asc;

--64
select extract(year from payment_date) as years,
       extract(month from payment_date) as months,      
       avg(amount) as total_payment
from payment
group by extract(year from payment_date),
         extract(month from payment_date)
order by months asc;

--65
select extract(hour from payment_date),
       count(payment_id)
from payment
group by extract(hour from payment_date)
order by extract(hour from payment_date) asc;

--66
with avg_customer as( 
                      select customer_id,
				             sum(amount) as total_payment
					  from payment
					  group by customer_id
				    )
select customer_id, 
       total_payment
from avg_customer
where total_payment > (select avg(total_payment) from avg_customer)
order by total_payment desc
limit 5 ;

--67
with avg_film_revenue as ( 
                           select title,
						          sum(payment.amount) as total_revenue
						   from film 
						   left join inventory on film.film_id = inventory.film_id
						   left join rental on inventory.inventory_id = rental.inventory_id
						   left join payment on rental.rental_id = payment.rental_id
						   group by title
					   )
select title,
       total_revenue
from avg_film_revenue
where total_revenue > ( select avg(total_revenue) 
                        from avg_film_revenue)
order by total_revenue desc
limit 10;

--68
with avg_no_rentals as (
                        select customer_id,
						       count(rental_id) as no_of_rentals
						from rental
						group by customer_id
					)
select customer_id,
       no_of_rentals
from avg_no_rentals
where no_of_rentals > (select avg(no_of_rentals)
                       from avg_no_rentals)
order by no_of_rentals desc
limit 10;

--69
with payment_per_customer as (
                               select customer_id,
							          sum(amount) as total_payment
							   from payment
							   group by customer_id
                             )
select customer_id,
       total_payment,
	   case when total_payment > (select avg(total_payment)
                           from payment_per_customer) then 'High'
	   else 'low'
	   end as payment_category
from payment_per_customer
order by total_payment desc;

--70
with film_category_revenue as ( 
                                select category.name as category,
								       sum(payment.amount) as total_revenue
								from category
								left join film_category on category.category_id = film_category.category_id
								left join film on film_category.film_id = film.film_id
								left join inventory on film.film_id = inventory.film_id
						        left join rental on inventory.inventory_id = rental.inventory_id
						        left join payment on rental.rental_id = payment.rental_id
								group by category.name
							)
select category,
       total_revenue
from film_category_revenue
where total_revenue > ( select avg(total_revenue) 
                        from film_category_revenue)
order by total_revenue desc;

--71 
select customer_id,
       sum(payment.amount) as total_payment
from payment
group by customer_id
having sum(amount) > ( 
                       select avg(total_payment) 
					   from (
                              select customer_id, 
							         sum(payment.amount) as total_payment
					          from payment
							  group by customer_id
							) as customer_avg_payment
					 )
order by total_payment desc;

--72
with film_revenue as ( select title,
                              rating,
                              sum(payment.amount) as total_revenue
					   from film 
					   left join inventory on film.film_id = inventory.film_id
					   left join rental on inventory.inventory_id = rental.inventory_id
					   left join payment on rental.rental_id = payment.rental_id
					   group by title, rating
                     )
select fr.title,
       fr.rating,
	   fr.total_revenue
from film_revenue as fr
where total_revenue > (
                       select avg(fr2.total_revenue)
                       from film_revenue as fr2
					   where fr2.rating = fr.rating
					  )
order by total_revenue desc;

--73
with customer_spendings as (
                             select customer_id,
							        sum(amount) as total_payment
							 from payment
							 group by customer_id
                           )
select cs.customer_id,
       cs.total_payment
from customer_spendings as cs
where cs.total_payment > ( 
                           select max(low.total_payment)
                           from (
                              select cs2.customer_id,
					                 cs2.total_payment, 
					                 count(rental.rental_id) as no_of_rentals
					          from customer_spendings as cs2
					          left join rental on cs2.customer_id = rental.customer_id
					          group by cs2.customer_id, cs2.total_payment
					          having count(rental.rental_id) < 20
							 ) as low
					   )
order by cs.total_payment desc;

--74
with film_revenue as ( select title,
                              rating,
							  rental_rate,
                              sum(payment.amount) as total_revenue
					   from film 
					   left join inventory on film.film_id = inventory.film_id
					   left join rental on inventory.inventory_id = rental.inventory_id
					   left join payment on rental.rental_id = payment.rental_id
					   group by title, rating, rental_rate
                     )
select f.title,
       f.rating, 
	   f.rental_rate,
	   f.total_revenue
from film_revenue as f 
where f.rental_rate > (
                        select avg(f2.rental_rate)
						from film_revenue as f2
						where f2.rating = f.rating
                     )
AND total_revenue > 20					 
order by total_revenue desc;   

--75
with customer_rental_money as (
                                select customer_id,
								       sum(amount) as total_payment,
									   count(rental_id) as no_of_rentals
								from payment
								group by customer_id
                              )
select customer_id,
       no_of_rentals,
	   total_payment
from customer_rental_money 
where no_of_rentals > (
                        select avg (no_of_rentals)
						from customer_rental_money
                      )
and total_payment > ( 
                     select avg(total_payment)
					 from customer_rental_money
					)
order by total_payment desc;
					  
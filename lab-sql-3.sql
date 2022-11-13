use sakila;
#1. How many distinct (different) actors' last names are there?
	select distinct count(last_name) from actor;

#2. In how many different languages where the films originally produced?
	select title, language_id
	from film;

#3. How many movies were released with "PG-13" rating
	select count(film_id)
	from film
	where rating ='PG-13';

#4. Get 10 the longest movies from 2006.
	select title, length 
	from film
	where release_year>=2006
	order by 2 desc
	LIMIT 10;

#5.How many days has been the company operating (check DATEDIFF() function)?

#6.Show rental info with additional columns month and weekday. Get 20.
	select *, MONTHNAME(rental_date) AS Rental_Month, 
	case
		when weekday(rental_date) = 1 then 'Monday'
		when weekday(rental_date) = 2 then 'Tuesday'
		when weekday(rental_date) = 3 then 'Wednesday'
		when weekday(rental_date) = 4 then 'Thursday'
		when weekday(rental_date) = 5 then 'Friday'
		when weekday(rental_date) = 6 then 'Satruday'
		else 'Sunday'
	end as 'Rental_Weekday'
	from rental
	limit 20;

#7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
	select *, MONTHNAME(rental_date) AS Rental_Month, 
    	case
		when weekday(rental_date) = 1 then 'Monday'
		when weekday(rental_date) = 2 then 'Tuesday'
		when weekday(rental_date) = 3 then 'Wednesday'
		when weekday(rental_date) = 4 then 'Thursday'
		when weekday(rental_date) = 5 then 'Friday'
		when weekday(rental_date) = 6 then 'Satruday'
		else 'Sunday'
	end as 'Rental_Weekday',
    	case
		when weekday(rental_date) = 6 then 'Weekend'
		when weekday(rental_date) = 0 then 'Weekend'
		else 'Workday'
	end as 'day_type'
	from rental;
    
    #8.How many rentals were in the last month of activity?
    
 select count(rental_id)
 from rental
 where convert(rental_date, date) between '2006-01-14' and '2006-02-14';
 
        
    
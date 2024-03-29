use mavenmovies;
-- Q1. Rank the customers based on total amounts they have spent on rentals??
select payment_id , customer_id , rental_id , amount , sum(amount) over() , 
dense_rank() over(partition by customer_id order by amount) from payment;

-- Q2. Calculate cumulative revenue generated by each film over time??
select title, replacement_cost, sum(replacement_cost) over(partition by title) from film; 

-- Q3. Determine the average rental duration for each film , considering film with similar length??
select title , rental_duration , length , avg(rental_duration) over(partition by length) from film;

-- Q4. Identify the top 3 films in each category based on their rental counts??
select title, rental_duration, dense_rank() over() from film limit 3; 

-- Q5. Calculate the difference in rental count between each customers total rental and 
-- average rental across all customers??
select customer_id , count(rental_id) as total_count , avg(count(rental_id)) 
over() as avg_count from rental group by customer_id;

-- Q6. Find the monthly revenue trend for the entire rental store over time??
select rental_id, amount, month(payment_date), sum(amount) 
over(partition by time(payment_date) order by month(payment_date))from payment;

-- Q10. Identify the top 5 Months with highest revenue and display the revenue generated by each month??
select amount, month(payment_date), sum(amount) 
over(partition by month(payment_date) order by amount desc)from payment limit 5;



-- models/staging/int_invoices.sql

select 
    to_date(date_trunc("month", month)) as month, -- Truncate to first day of the month
    movie_id,
    location_id,
    SUM(weekly_rental_cost) as weekly_rental_cost,
    SUM(total_rental_cost) as total_rental_cost
from {{ ref('stg_invoices') }}
group by month, movie_id, location_id
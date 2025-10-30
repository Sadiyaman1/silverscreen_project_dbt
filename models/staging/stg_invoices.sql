-- models/staging/stg_invoices.sql

select 
    movie_id,
    to_date(date_trunc("month", month)) as month, -- Truncate to first day of the month
    location_id,
    weekly_price as weekly_rental_cost,
    total_invoice as total_rental_cost
from {{ source("silverscreen", "invoices") }}

-- models/staging/stg_movie_catalogue.sql

select 
    movie_id,
    movie_title,
    release_date,
    coalesce(genre, 'Unknown') as genre,
    studio
from {{ source('silverscreen', 'movie_catalogue') }}


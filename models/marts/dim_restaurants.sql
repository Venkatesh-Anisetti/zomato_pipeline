{{
    config(
        materialized = 'table',
        database = 'zomato',
        schema = 'marts'
    )
}}

select
    restaurant_id,
    restaurant_name,
    city,
    cuisine,
    rating,
    cost_for_two
from {{ref('stg_restaurants')}}
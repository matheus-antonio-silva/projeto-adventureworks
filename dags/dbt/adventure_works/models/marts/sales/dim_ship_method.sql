WITH ship as (
    SELECT *
    FROM {{ref('int_ship_method')}}
)

SELECT *
FROM ship
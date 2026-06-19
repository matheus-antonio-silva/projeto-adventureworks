WITH int_table AS (
    SELECT *
    FROM {{ref('int_product_joined')}}
)

SELECT *
FROM int_table
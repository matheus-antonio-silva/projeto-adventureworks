WITH customer AS(

    SELECT *
    FROM {{ref('int_customer_joined')}}
)

SELECT *
FROM customer
WITH address_table AS(

    SELECT *
    FROM {{ref('int_adress')}}
)

SELECT *
FROM address_table
WITH special_offer AS(
    SELECT *
    FROM {{ref('int_sales_special_offer')}}
)

SELECT *
FROM special_offer
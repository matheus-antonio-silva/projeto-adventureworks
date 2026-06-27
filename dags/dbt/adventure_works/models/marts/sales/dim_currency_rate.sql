WITH currency_rate AS(
    SELECT *
    FROM {{ref('int_currency_rate')}}
)

SELECT *
FROM currency_rate
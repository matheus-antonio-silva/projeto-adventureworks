WITH currency_rate AS(
    SELECT *
    FROM {{ref('stg_sales_currency_rate')}}
)


SELECT *
FROM currency_rate
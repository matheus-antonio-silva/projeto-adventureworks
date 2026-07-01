WITH sales_reason AS(
    SELECT *
    FROM {{ref('int_sales_reason')}}
)

SELECT *
FROM sales_reason
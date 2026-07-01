WITH sales_reason AS (
SELECT *
FROM {{ref('stg_sales_reason')}}
)

SELECT  *
FROM sales_reason
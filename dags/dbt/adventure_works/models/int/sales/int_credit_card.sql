WITH cc AS(
    SELECT  credit_card_id,
            card_type,
            card_number
    FROM {{ref('stg_sales_credit_card')}}
)

SELECT *
FROM cc
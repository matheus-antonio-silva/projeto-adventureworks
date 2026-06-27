WITH shipping AS (
    SELECT  ship_method_id,
            ship_method_name,
            ship_base,
            ship_rate
    FROM {{ref('stg_purchasing_ship_method')}}
)
SELECT *
FROM shipping
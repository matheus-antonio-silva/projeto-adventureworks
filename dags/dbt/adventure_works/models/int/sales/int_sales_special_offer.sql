WITH special_offer AS (
    SELECT
        special_offer_id,
        description AS special_offer_description,
        category AS special_offer_category,
        special_offer_type,
        CASE
            WHEN max_qty IS NULL AND min_qty > 0 THEN CONCAT('+', CAST(min_qty AS STRING))
            WHEN max_qty IS NULL THEN '0'
            ELSE CONCAT(
                CAST(COALESCE(min_qty, 0) AS STRING),
                '-',
                CAST(max_qty AS STRING)
            )
        END AS limit_qty_offer,
        date_start AS special_offer_start,
        date_end AS special_offer_end
    FROM {{ref('stg_sales_special_offer')}})
SELECT *
FROM special_offer
order by 1 asc
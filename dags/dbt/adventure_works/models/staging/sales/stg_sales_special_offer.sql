{{
    config(
        tags=['sales']
    )
}}

WITH source AS (

    SELECT
        _airbyte_raw_id,
        _airbyte_extracted_at,
        _airbyte_meta,
        `Type`          AS special_offer_type,
        MaxQty          AS max_qty,
        MinQty          AS min_qty,
        EndDate         AS date_end,
        rowguid         AS id,
        Category        AS category,
        StartDate       AS date_start,
        Description     AS description,
        DiscountPct     AS discount_pct,
        ModifiedDate    AS date_modified,
        SpecialOfferID  AS special_offer_id
    FROM {{ source('adventure_works_sales', 'SalesSpecialOffer') }}

)

SELECT *
FROM source
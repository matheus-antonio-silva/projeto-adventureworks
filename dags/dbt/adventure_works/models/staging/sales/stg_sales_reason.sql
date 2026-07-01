{{
    config(
        tags=['sales']
    )
}}

WITH source AS (

    SELECT
        SalesReasonID  AS sales_reason_id,
        Name           AS sales_reason_name,
        ReasonType     AS sales_reason_type,
        ModifiedDate   AS date_modified,
        
    FROM {{ source('adventure_works_sales', 'SalesSalesReason') }}

)

SELECT *
FROM source
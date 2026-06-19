{{
    config(
        tags=['sales']
    )
}}

WITH source AS (

    SELECT 
        SalesOrderID AS sales_order_id,
        SalesReasonID AS sales_reason_id,
        ModifiedDate AS date_modified

    FROM {{ source('adventure_works_sales', 'SalesSalesOrderHeaderSalesReason') }}

)

SELECT *
FROM source
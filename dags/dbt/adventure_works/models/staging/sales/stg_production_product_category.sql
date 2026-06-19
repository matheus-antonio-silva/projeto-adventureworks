{{
    config(
        tags=['production']
    )
}}

WITH source AS (

    SELECT
        ProductCategoryID AS product_category_id,
        Name AS product_category_name,
        rowguid AS rowguid,
        ModifiedDate AS date_modified

    FROM {{ source('adventure_works_sales', 'ProductionProductCategory') }}

)

SELECT *
FROM source
{{
    config(
        tags=['production']
    )
}}

WITH source AS (

    SELECT
        ProductSubcategoryID AS product_subcategory_id,
        ProductCategoryID AS product_category_id,
        Name AS product_subcategory_name,
        rowguid AS rowguid,
        ModifiedDate AS date_modified

    FROM {{ source('adventure_works_sales', 'ProductionProductSubcategory') }}

)

SELECT *
FROM source
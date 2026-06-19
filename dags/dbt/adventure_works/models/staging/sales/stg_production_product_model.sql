{{
    config(
        tags=['production']
    )
}}

WITH source AS (

    SELECT
        ProductModelID AS product_model_id,
        Name AS product_model_name,
        CatalogDescription AS catalog_description,
        Instructions AS instructions,
        rowguid AS rowguid,
        ModifiedDate AS date_modified

    FROM {{ source('adventure_works_sales', 'ProductionProductModel') }}

)

SELECT *
FROM source
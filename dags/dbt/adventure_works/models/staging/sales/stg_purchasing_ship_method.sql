{{
    config(
        tags=['purchasing']
    )
}}

WITH source AS (

    SELECT
        Name AS ship_method_name,
        rowguid,
        ShipBase AS ship_base,
        ShipRate AS ship_rate,
        ModifiedDate AS date_modified,
        ShipMethodID AS ship_method_id
    FROM {{ source('adventure_works_sales', 'PurchasingShipMethod') }}

)

SELECT *
FROM source
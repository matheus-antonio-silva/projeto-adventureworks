{{ 
    config(
        tags=['person']
    ) 
}}

WITH source AS (

    SELECT
        AddressID         AS address_id,
        AddressLine1      AS address_line_1,
        AddressLine2      AS address_line_2,
        City              AS city,
        StateProvinceID   AS state_province_id,
        PostalCode        AS postal_code,
        SpatialLocation   AS spatial_location,
        rowguid           AS rowguid,
        ModifiedDate      AS date_modified

    FROM {{ source('adventure_works_sales', 'PersonAddress') }}

)

SELECT *
FROM source
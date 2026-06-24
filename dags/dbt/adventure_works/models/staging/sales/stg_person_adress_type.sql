{{ 
    config(
        tags=['person']
    ) 
}}

WITH source AS (

    SELECT
        AddressTypeID     AS address_type_id,
        Name              AS address_type_name,
        rowguid           AS rowguid,
        ModifiedDate      AS date_modified

    FROM {{ source('adventure_works_sales', 'PersonAddressType') }}

)

SELECT *
FROM source
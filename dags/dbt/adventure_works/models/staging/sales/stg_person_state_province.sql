{{ 
    config(
        tags=['person']
    ) 
}}

WITH source AS (

    SELECT
        StateProvinceID            AS state_province_id,
        StateProvinceCode          AS state_province_code,
        CountryRegionCode          AS country_region_code,
        IsOnlyStateProvinceFlag    AS is_only_state_province_flag,
        Name                       AS state_province_name,
        TerritoryID                AS territory_id,
        rowguid                    AS rowguid,
        ModifiedDate               AS date_modified

    FROM {{ source('adventure_works_sales', 'PersonStateProvince') }}

)

SELECT *
FROM source
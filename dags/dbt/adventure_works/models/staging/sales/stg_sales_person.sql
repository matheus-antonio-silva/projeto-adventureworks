{{
    config(
        tags=['sales']
    )
}}

WITH source AS (

    SELECT 
        BusinessEntityID AS business_entity_id,
        TerritoryID AS territory_id,
        SalesQuota AS sales_quota,
        Bonus AS bonus,
        CommissionPct AS commission_pct,
        SalesYTD AS sales_ytd,
        SalesLastYear AS sales_last_year,
        rowguid AS rowguid,
        ModifiedDate AS date_modified

    FROM {{ source('adventure_works_sales', 'SalesSalesPerson') }}

)

SELECT *
FROM source
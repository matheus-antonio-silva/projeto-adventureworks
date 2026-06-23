
{{
    config(
        tags=['sales']
    )
}}

WITH source AS(

    SELECT  rowguid             as id,
            TerritoryID         as territory_id,
            Name                as territory_name,
            `Group`                as territory_group,
            CostYTD             as cost_ytd,
            SalesYTD            as sales_ytd,
            CostLastYear        as cost_last_year,
            ModifiedDate        as date_modified,
            SalesLastYear       as sales_last_year,
            CountryRegionCode   as country_region_code
    FROM {{source('adventure_works_sales','SalesSalesTerritory')}}
)

SELECT *
FROM source
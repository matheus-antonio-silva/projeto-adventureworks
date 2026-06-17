{{
    config(
        tags=['sales']
    )
}}

WITH souce AS (

    SELECT 
                  
                CurrencyCode AS currency_code,
                ModifiedDate  as date_modified,
                CountryRegionCode as country_region_code
    
    FROM {{source('adventure_works_sales','SalesCountryRegionCurrency')}}
)

SELECT *
FROM souce
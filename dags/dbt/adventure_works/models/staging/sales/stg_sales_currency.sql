{{
    config(
        tags=['sales']
    )
}}

WITH souce AS (

    SELECT 
            Name         as name_currency,
            CurrencyCode as currency_code,
            ModifiedDate as date_modified
    
    FROM {{source('adventure_works_sales','SalesCurrency')}}
)

SELECT *
FROM souce
{{
    config(
        tags=['sales']
    )
}}

WITH souce AS (

    SELECT 
            CurrencyRateDate as data_currency_date,
            ModifiedDate as date_modified,
            CurrencyRateID as currency_rate_id,
            ToCurrencyCode as to_currency_code,
            FromCurrencyCode as from_currency_code,
            AverageRate      as average_rate,
            EndOfDayRate     as end_of_day_rate
            
            
            
            
           
    
    FROM {{source('adventure_works_sales','SalesCurrencyRate')}}
)

SELECT *
FROM souce
{{
    config(
        tags=['sales']
    )
}}

WITH souce AS (

    SELECT 
            CreditCardID AS credit_card_id,
            ModifiedDate AS date_modified,
            CardType as card_type,
            CardNumber as card_number,
            ExpYear as year_exp,
            ExpMonth as month_exp
    
    FROM {{source('adventure_works_sales','SalesCreditCard')}}
)

SELECT *
FROM souce
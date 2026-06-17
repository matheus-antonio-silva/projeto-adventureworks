{{
    config(
        tags=['sales']
    )
}}

WITH souce AS (

    SELECT 
            CreditCardID    as credit_card_id,
            ModifiedDate    as date_modified,
            BusinessEntityID    as business_entity_id
    FROM {{source('adventure_works_sales','SalesPersonCreditCard')}}
)

SELECT *
FROM souce
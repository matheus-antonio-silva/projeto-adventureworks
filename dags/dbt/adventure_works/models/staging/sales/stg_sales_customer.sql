{{config 
    (tags = ['sales'])
}}

WITH source AS (
    SELECT  rowguid as id,
            ModifiedDate as date_modified,
            CustomerID as customer_id,
            PersonID as person_id,
            TerritoryID as territory_id,
            StoreID as store_id,
            AccountNumber as account_number

           
    FROM {{source('adventure_works_sales','SalesCustomer')}}
)

SELECT *
FROM source
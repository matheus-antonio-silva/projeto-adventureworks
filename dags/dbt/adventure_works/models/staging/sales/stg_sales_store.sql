{{
    config(tags = ['sales'])
    
}}

WITH source AS (
        
    SELECT  rowguid as id, 
            BusinessEntityID as store_id,
            Name as store_name,
            ModifiedDate as date_modified,
            Demographics as data_demographics, 
            SalesPersonID as person_id
    FROM {{source('adventure_works_sales','SalesStore')}}
)

SELECT *
FROM source
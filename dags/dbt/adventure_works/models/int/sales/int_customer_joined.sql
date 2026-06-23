WITH customer AS (
    SELECT
        customer_id,
        store_id,
        person_id
    FROM {{ref('stg_sales_customer')}}
),
store AS (
    SELECT
        store_id,
        store_name
    FROM {{ref('stg_sales_store')}}
),
person AS (
    SELECT
        business_entity_id,
        first_name,
        middle_name,
        last_name
    FROM  {{ref('stg_person_person')}}
),
joined AS (
    SELECT
        t1.customer_id,
        t1.store_id,
        t2.store_name,
        t1.person_id,
        t3.first_name,
        t3.middle_name,
        t3.last_name
    FROM customer AS t1
    LEFT JOIN store AS t2
        ON t1.store_id = t2.store_id
    LEFT JOIN person AS t3
        ON t1.person_id = t3.business_entity_id
),
final_table AS(
SELECT
    customer_id,
    CASE
        WHEN person_id IS NULL THEN store_id
        ELSE person_id
    END AS business_id,
    CASE
        WHEN person_id IS NULL THEN 'Store'
        ELSE 'Person'
    END AS customer_type,
    CASE
        WHEN person_id IS NULL THEN store_name
        ELSE TRIM(REGEXP_REPLACE(CONCAT(
            COALESCE(first_name, ''), ' ',
            COALESCE(middle_name, ''), ' ',
            COALESCE(last_name, '')
        ), r'\s+', ' '))
    END AS customer_name
    FROM joined
)
SELECT *
FROM final_table


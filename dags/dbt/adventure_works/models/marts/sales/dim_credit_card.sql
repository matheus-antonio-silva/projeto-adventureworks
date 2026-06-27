WITH cc as (
    SELECT *
    FROM {{ref('int_credit_card')}}
)

SELECT *
FROM cc
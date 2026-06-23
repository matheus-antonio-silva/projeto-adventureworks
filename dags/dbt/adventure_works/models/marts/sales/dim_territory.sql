WITH territory AS(

    SELECT *
    FROM {{ref('int_territory')}}
)

SELECT *
FROM territory
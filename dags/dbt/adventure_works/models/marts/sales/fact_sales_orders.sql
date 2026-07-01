WITH orders AS(

    select *
    from {{ref('int_order_joined')}}
)

SELECT *
FROM orders
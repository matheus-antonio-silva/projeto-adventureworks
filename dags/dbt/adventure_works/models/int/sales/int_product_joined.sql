WITH product AS (
SELECT *
FROM {{ref('stg_production_product')}}
),
subcategory AS(
SELECT *
FROM {{ref('stg_production_product_subcategory')}}
),
category AS (
SELECT *
FROM {{ref('stg_production_product_category')}}
),
joined AS (
SELECT product.product_id,
	   product.product_name,
	   product.product_color,
	   product.product_class,
	   product.product_style,
	   subcategory.product_subcategory_name,
	   category.product_category_name 
FROM product
LEFT JOIN subcategory
	ON product.product_subcategory_id = subcategory.product_subcategory_id
LEFT JOIN category
	ON subcategory.product_category_id = category.product_category_id 
)
SELECT *
FROM joined

--WHERE subcategory.subcategory is not NULL

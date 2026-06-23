WITH territory AS(
SELECT territory_id,
	   territory_name,
	   territory_group,
	   country_region_code
FROM {{ref('stg_sales_territory')}}
ORDER BY 1 ASC)
SELECT *
FROM territory

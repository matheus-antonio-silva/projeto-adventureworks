WITH address_table AS (
    SELECT *
    FROM {{ref('stg_person_adress')}}),
province AS (
    SELECT *
    FROM {{ref('stg_person_state_province')}}),
territory AS (
    SELECT *
    FROM {{ref('stg_sales_territory')}}),
joined AS (
    SELECT
        t1.address_id,
        t1.state_province_id,
        t1.city,
        t1.address_line_1,
        t1.address_line_2,
        t1.postal_code,
        t2.state_province_name,
        t2.state_province_code,
        t2.country_region_code AS province_country_region_code,
        t2.territory_id,
        t3.territory_name,
        t3.territory_group,
        t3.country_region_code AS territory_country_region_code
    FROM address_table AS t1
    LEFT JOIN province AS t2
        ON t1.state_province_id = t2.state_province_id
    LEFT JOIN territory AS t3
        ON t3.territory_id = t2.territory_id),
final_table AS (
    SELECT
        address_id,
        territory_group AS continent,
        territory_name AS country,
        province_country_region_code AS country_code,
        state_province_name AS province_name,
        state_province_code AS province_code,
        city,
        COALESCE(address_line_1, address_line_2) AS address_line,
        postal_code AS postal_code
    FROM joined)
SELECT *
FROM final_table
ORDER BY address_id

{{
    config(
        tags=['production']
    )
}}

WITH source AS (

    SELECT
        ProductID AS product_id,
        ProductNumber AS product_number,
        Name AS product_name,
        Color AS product_color,
        Size AS product_size,
        SizeUnitMeasureCode AS size_unit_measure_code,
        Weight AS product_weight,
        WeightUnitMeasureCode AS weight_unit_measure_code,
        ProductLine AS product_line,
        Class AS product_class,
        Style AS product_style,
        ProductSubcategoryID AS product_subcategory_id,
        ProductModelID AS product_model_id,
        StandardCost AS standard_cost,
        ListPrice AS list_price,
        ReorderPoint AS reorder_point,
        SafetyStockLevel AS safety_stock_level,
        DaysToManufacture AS days_to_manufacture,
        MakeFlag AS is_manufactured_internally,
        FinishedGoodsFlag AS is_finished_goods,
        SellStartDate AS date_sell_start,
        SellEndDate AS date_sell_end,
        DiscontinuedDate AS date_discontinued,
        rowguid AS rowguid,
        ModifiedDate AS date_modified

    FROM {{ source('adventure_works_sales', 'ProductionProduct') }}

)

SELECT *
FROM source
{{
    config(
        tags=['sales']
    )
}}

WITH souce AS (

    SELECT 
            rowguid as id,
            SalesOrderDetailID as sales_order_detail_id,
            ModifiedDate as date_modified,
            SalesOrderID as sales_order_id,
            CarrierTrackingNumber as carrier_tracking_number,
            ProductID as product_id,
            OrderQty as order_qty,
            UnitPrice as unit_price,
            UnitPriceDiscount as unit_price_discount,
            SpecialOfferID as special_offer_id,
            LineTotal as line_total

    
    FROM {{source('adventure_works_sales','SalesSalesOrderDetail')}}
)

SELECT *
FROM souce
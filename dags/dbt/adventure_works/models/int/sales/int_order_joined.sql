WITH orders_details AS (
    SELECT *
    FROM {{ref('stg_sales_orders_details')}}
),
orders_headers_sales_reason AS(
SELECT *
FROM {{ref('stg_sales_order_header_sales_reason')}}
),
orders_headers AS (
    SELECT *
    FROM {{ref('stg_sales_order_header')}}
),
joined AS (
    SELECT
        t1.sales_order_id,
        t1.sales_order_number,
        t3.sales_reason_id,
        t1.revision_number,
        t1.date_order,
        t1.date_due,
        t1.date_ship,
        t1.status,
        t1.is_online_order,
        t1.purchase_order_number,
        t1.account_number,
        t1.customer_id,
        t1.sales_person_id,
        t1.territory_id,
        t1.bill_to_address_id,
        t1.ship_to_address_id,
        t1.ship_method_id,
        t1.credit_card_id,
        t1.credit_card_approval_code,
        t1.currency_rate_id,
        t1.subtotal,
        t1.tax_amount,
        t1.freight_amount,
        t1.total_due,
        t1.comment,
        t1.rowguid AS sales_order_header_rowguid,
        t1.date_modified AS sales_order_header_date_modified,
        t2.id AS sales_order_detail_row_id,
        t2.sales_order_detail_id,
        t2.date_modified AS sales_order_detail_date_modified,
        t2.carrier_tracking_number,
        t2.product_id,
        t2.order_qty,
        t2.unit_price,
        t2.unit_price_discount,
        t2.special_offer_id,
        t2.line_total
    FROM orders_headers AS t1
    LEFT JOIN orders_details AS t2
        ON t1.sales_order_id = t2.sales_order_id
    LEFT JOIN orders_headers_sales_reason AS t3
    	ON t1.sales_order_id = t3.sales_order_id),
final AS (
    SELECT
        sales_order_id,
        sales_order_number,
        sales_reason_id,
        revision_number,
        date_order,
        purchase_order_number,
        customer_id,
        account_number,
        credit_card_id,
        credit_card_approval_code,
        date_due,
        territory_id,
        CASE
            WHEN is_online_order = TRUE THEN 'Online Order'
            ELSE 'Store Order'
        END AS type_order,
        bill_to_address_id,
        ship_to_address_id,
        ship_method_id,
        product_id,
        order_qty,
        unit_price,
        unit_price_discount,
        special_offer_id,
        tax_amount,
        freight_amount
    FROM joined
)
SELECT *
FROM final

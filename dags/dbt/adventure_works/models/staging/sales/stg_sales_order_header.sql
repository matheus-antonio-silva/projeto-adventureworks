{{
    config(
        tags=['sales']
    )
}}

WITH source AS (

    SELECT 
        SalesOrderID AS sales_order_id,
        SalesOrderNumber AS sales_order_number,
        RevisionNumber AS revision_number,
        OrderDate AS date_order,
        DueDate AS date_due,
        ShipDate AS date_ship,
        Status AS status,
        OnlineOrderFlag AS is_online_order,
        PurchaseOrderNumber AS purchase_order_number,
        AccountNumber AS account_number,
        CustomerID AS customer_id,
        SalesPersonID AS sales_person_id,
        TerritoryID AS territory_id,
        BillToAddressID AS bill_to_address_id,
        ShipToAddressID AS ship_to_address_id,
        ShipMethodID AS ship_method_id,
        CreditCardID AS credit_card_id,
        CreditCardApprovalCode AS credit_card_approval_code,
        CurrencyRateID AS currency_rate_id,
        SubTotal AS subtotal,
        TaxAmt AS tax_amount,
        Freight AS freight_amount,
        TotalDue AS total_due,
        Comment AS comment,
        rowguid AS rowguid,
        ModifiedDate AS date_modified

    FROM {{ source('adventure_works_sales', 'SalesSalesOrderHeader') }}

)

SELECT *
FROM source
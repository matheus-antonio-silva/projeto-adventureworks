{{

    config(
        tags=['person']
    )
}}

with source as (

    select
        BusinessEntityID as business_entity_id,
        PersonType as person_type,
        NameStyle as name_style,
        Title as title,
        FirstName as first_name,
        MiddleName as middle_name,
        LastName as last_name,
        Suffix as suffix,
        EmailPromotion as email_promotion,
        AdditionalContactInfo as additional_contact_info,
        Demographics as demographics,
        rowguid as rowguid,
        ModifiedDate as modified_date
    from {{ source('adventure_works_sales', 'PersonPerson') }}

)
select *
from source
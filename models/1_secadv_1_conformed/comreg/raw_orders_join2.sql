
with source as (
      select * from {{ source('comreg', 'orders_join2') }}
),
renamed as (
    select
        {{ adapter.quote("ORDER_ID") }},
        {{ adapter.quote("ORDER_DATE") }},
        {{ adapter.quote("CUSTOMER_ID") }},
        {{ adapter.quote("AMOUNT") }}

    from source
)
select *,{{ get_current_date()  }} as process_date from renamed
  
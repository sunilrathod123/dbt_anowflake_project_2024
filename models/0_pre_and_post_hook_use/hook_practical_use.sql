{{ config(
    pre_hook="INSERT INTO demo.public.audit_log (model_name, action, timestamp) VALUES ('{{ this.name }}', 'start', current_timestamp)",
    post_hook="INSERT INTO demo.public.audit_log (model_name, action, timestamp) VALUES ('{{ this.name }}', 'end', current_timestamp)"
) }}

with source as (
    select * from {{ source('comreg', 'customers_join1') }}
),
renamed as (
    select
        {{ adapter.quote('CUSTOMER_ID') }},
        {{ adapter.quote('CUSTOMER_NAME') }},
        {{ adapter.quote('CUSTOMER_EMAIL') }},
        {{ adapter.quote('CUSTOMER_PHONE') }}
    from source
)
select *, {{ get_current_date() }} as process_date from renamed


with source as (
      select * from {{ source('source_public_schema', 'custmer') }}
),
renamed as (

    select
    *
   from source
)
select * from renamed order by CUSTOMER_ID
  
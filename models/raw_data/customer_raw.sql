
with source as (
      select * from {{ source('source_public_schema', 'custmer') }}
),
renamed as (

    select
    *
   from source
)

select *, {{ double_Salary()}} from renamed order by CUSTOMER_ID
-- using macros here



with source as (
      select * from {{ source('raw_data_source', 'EMP') }}
),
renamed as (

    select
    *
   from source
)

select *, {{ double_Salary()}} from renamed 
-- using macros here


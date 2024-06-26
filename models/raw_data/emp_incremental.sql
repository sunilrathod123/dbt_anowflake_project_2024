{{
  config(  materialized='incremental', unique_key= 'EMPLOYEE_ID' )
}}

-- when we use unique_key duplicate record not allowed
-- when rqmoved unique_key duplicate record also inserted

-- delete+ insert (delete the record from target table and insert new record from source
-- add in block :  incremental_strategy='delete+insert' 


with source as (

select * from DEMO.PUBLIC.EMPLOYEE

{% if is_incremental() %}

  where HIRE_DATE >= ((select max(HIRE_DATE) from {{ this }}))

{% endif %}

)

select * from source



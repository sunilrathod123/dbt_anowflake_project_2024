{{
  config(  materialized='incremental', unique_key= 'EMPLOYEE_ID' )
}}


with source as (

select * from DEMO.PUBLIC.EMPLOYEE

{% if is_incremental() %}

  and HIRE_DATE >= ((select max(HIRE_DATE) from {{ this }}))

{% endif %}

)

select * from source

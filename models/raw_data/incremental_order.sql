{{
  config(  materialized='incremental', incremental_strategy = 'delete+insert', unique_key= 'ORDER_ID' )
}}

-- when we use unique_key duplicate record not allowed
-- when rqmoved unique_key duplicate record also inserted

-- delete+ insert (delete the record from target table and insert new record from source
-- add in block :  incremental_strategy='delete+insert' 


with source as (

select * from DEMO.PUBLIC.ORDER_DATE_RECORD

{% if is_incremental() %}

  where ORDER_DATE >= ((select max(ORDER_DATE) from {{ this }}))

{% endif %}

)

select * from source



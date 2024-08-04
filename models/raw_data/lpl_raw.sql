{{
  config(
   
    materialized='table'
  )
}}


with source as (

select * from {{ source('raw_data_source', 'lpl') }}

 )

 select *,'{{var("todayss")}}'::date as var_Date from source

 
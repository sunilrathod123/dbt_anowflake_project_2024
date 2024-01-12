with source as (
 
 select * from {{ source('raw_data_source', 'ord') }} )

 select * from source
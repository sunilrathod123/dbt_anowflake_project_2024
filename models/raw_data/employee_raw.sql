with source as (
 
 select * from {{ source('raw_data_source', 'EMP') }} )

 select * from source
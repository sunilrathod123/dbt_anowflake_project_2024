with source as (
 
 select * from {{ source('raw_data_source', 'PRD') }} )

 select * from source
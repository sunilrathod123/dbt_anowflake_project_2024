with source as (
 
 select * from {{ source('analysis_source','prod') }}
)

 select * from source
with source as (
 
 select * from {{ source('analysis_source','ord') }}
)

 select * from source
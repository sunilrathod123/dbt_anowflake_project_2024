with source as (
 
 select * from {{ source('analysis_source', 'usr') }}
)

 select * from source
with cte as (

select * from {{ source('analysis_source', 'ord') }}

)

select * from cte

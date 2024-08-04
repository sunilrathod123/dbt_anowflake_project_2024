with cte as (

    select * from {{ ref('process_data_as_per_date') }}
)

select * from cte where c_date='{{ var("todayss") }}'::date

-- from above query get 0 record because condition not match
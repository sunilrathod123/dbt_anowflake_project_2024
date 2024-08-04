with cte as (  

select * from {{ ref('conformed_sales')}}

)

select *,'{{ var("process_date") }}' as process_date from cte where AS_OF_DATE>=DATEADD(year, -2, CURRENT_DATE)
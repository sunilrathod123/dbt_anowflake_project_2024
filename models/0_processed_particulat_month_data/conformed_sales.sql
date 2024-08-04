with cte as (  
-- write logic to load only new and updated record rather than loading again existing data from source

select * from demo.public.processed_sales_data

)

select  ID,NAME,DEPT,DATE AS AS_OF_DATE from cte
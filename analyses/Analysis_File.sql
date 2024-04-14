with source as (
 
 select * from DEMO.PUBLIC.EMPLOYEE
)

 select department,sum(salary) as total_sum,min(salary) as min_Sal,max(salary) as max_Sal from source where Hire_date<=current_timestamp() group by department
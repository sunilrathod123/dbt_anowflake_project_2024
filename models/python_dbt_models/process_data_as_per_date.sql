with cte as (

select * from DEMO.AUTOMIBILE.CAR

)

select *,current_date() as c_date from cte
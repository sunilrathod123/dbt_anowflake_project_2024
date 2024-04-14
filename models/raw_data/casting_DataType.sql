
with source as (
select * from DEMO.PUBLIC.EMPLOYEE

),

casting as (

    select salary,cast(salary as decimal(10,1)) as decimal_salary, cast(salary as number) as signed_Salary,
    cast(salary as double) as double_salary,round(salary) as rounded_Salary,floor(salary) as floor_Salary,
    ceil(salary)as ceil_salary, cast(salary as varchar) as char_salary from source
)

select * from casting




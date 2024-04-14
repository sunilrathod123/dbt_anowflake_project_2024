with source as (
      select * from  DEMO.PUBLIC.RAW_EMP
),
renamed as (

    select
    *,coalesce(salary,100) as new_Salary,coalesce(ID,000) as ID_new,
    coalesce(CITY,'KHADKI') as CITY_NEW
   from source
),
null_handle as (
    
    select *,coalesce(gender,NAME) AS upaded_gender from renamed 
    
    )

select * from null_handle 


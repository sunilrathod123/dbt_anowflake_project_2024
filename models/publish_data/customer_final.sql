with source as (

select * from {{ ref("customer_confirmed") }}

),

final_data_customer as (

select CUSTOMER_ID,full_name,BIRTH_YEAR, ROUND(SALARY) from source where SALARY BETWEEN 60000 AND 80000 ORDER BY SALARY

)

select * FROM final_data_customer ORDER BY CUSTOMER_ID
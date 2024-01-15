with source as (

    select * from {{ ref("customer_raw") }}
),
remove_duplicate as (

    select distinct * from source 
),

full_name as(

    select *,concat(FIRST_NAME,' ',LAST_NAME) as full_name, year(BIRTH_DATE) as BIRTH_YEAR from remove_duplicate
)

select * FROM full_name






{{
  config(
    materialized = 'view',
    )
}}


with source as (


select * from {{ source('source_public_schema', 'custmer') }}

),

conformed as (

select 
      cast(CAR_ID as number) as ID,
      make as company_manufacturer,
      model as car_model,
      year as m_year,
      COLOR as car_colour,
      round(PRICE) as price,
      current_date() as c_date,
      year(current_date()) as c_year,
      quarter(current_date()) as c_quarter,
      current_timestamp() as tm

from
    source    

)

select * FROM conformed
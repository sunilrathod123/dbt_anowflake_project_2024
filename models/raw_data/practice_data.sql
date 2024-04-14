with reff as (

select * from {{ ref('car_raw') }} 

)

SELECT * FROM reff

  
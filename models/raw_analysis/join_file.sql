{{
  config(
    
    materialized='table'
  )
}}


with cte1 as (
 
 select * from {{ ref('order_raw_analysis')}}

),

cte2 as (

 select * from {{ ref("user_raw_practice") }}

 ),

 join_as as (  

select
 u.*,o.* 
 from cte1 u inner join cte2 o 
 on u.user_id=o.user_id 
 and u.order_id in (101,102,103) 
 and o.username is not null

 )

select order_id,order_Date,username,email from join_as 





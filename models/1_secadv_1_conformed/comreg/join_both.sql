{{ config(materialized="table") }}   

with cte_customer as (

    select * from {{ ref('raw_customers_join1') }}
),

cte_orders as (

    select * FROM {{ ref('raw_orders_join2') }}
),

join_both as (

    select 
    c.customer_id, 
    c.customer_name, 
    c.customer_email, 
    c.customer_phone, 
    co.order_id, 
    co.order_date, 
    co.amount,
    co.process_date

    from cte_customer c left join cte_orders co 
    on c.CUSTOMER_ID= co.CUSTOMER_ID and co.process_date=current_Date() where c.CUSTOMER_ID <>'' or c.CUSTOMER_ID is not null
)

select * from join_both
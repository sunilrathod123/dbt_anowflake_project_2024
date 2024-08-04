-- when we are not mentioning materializtion >> it take from dbt_project.yml file 
-- for view ::when there is no new record added in source then , count not increase when we run dbt run
-- for table also :when there is no new record added in source then , count not increase when we run dbt run

{# vvimp: when we use only  materialized='incremental' then same record appended every time
 even if souce table have same count. when we run dag same record added everytile in target table #}

-- below is syatax don't use
{# {{
    config(
        materialized='incremental'
    )
}} #}

-- --------------------------------second approach >use below approach to avoid duplicate record
-- when we get duplicate value in  unique_key= "CUSTOMER_ID" the model failed.

{# {{
    config(
        materialized='incremental',
        unique_key= "CUSTOMER_ID"
    )
}} #}

--  third approach>> this allow duplicate unique_key, whe source table contain duplicate value then then only

{{
    config(
        materialized= 'incremental',
        incremental_strategy= 'delete+insert',
        unique_key= "CUSTOMER_ID"
    )
}}

with source as (
      select * from {{ source('comreg', 'customers_join1') }}
),
renamed as (
    select
        {{ adapter.quote("CUSTOMER_ID") }},
        {{ adapter.quote("CUSTOMER_NAME") }},
        {{ adapter.quote("CUSTOMER_EMAIL") }},
        {{ adapter.quote("CUSTOMER_PHONE") }},
        {{ get_current_date()  }} as process_date

    from source
)
select * from renamed
  





  {% if is_incremental() %}

  where process_date::date>(select max(process_date::date) from {{ this }}) 

{% endif %}

-- below sytax useful for timestamp column
  {# {% if is_incremental() %}

  where process_date::date not in (select process_date::date from {{ this }}) or select max(process_date) from {{ this }}) is null

{% endif %} #}
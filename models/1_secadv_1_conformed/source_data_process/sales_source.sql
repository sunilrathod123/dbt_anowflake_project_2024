{{
  config(
    materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key='ID'
  )
}}


select * from demo.PUBLIC.sales_data

-- If this is an incremental run, filter to only include recently updated records
{% if is_incremental() %}
where last_updated >= coalesce(
  (select max(last_updated) from {{ this }}), 
  '1900-01-01')  -- Fallback date to include all records if there are no previous records

{% endif %}

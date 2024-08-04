
-- by using snapshot we can achive scd type 2
-- by using incremental load delete and insert we can achive scd type1
-- snpapshot is working as excepted 
{% snapshot stock_snap %}

{{
   config(
       target_database='DEMO',
       target_schema='new_snapshot',
       unique_key='ID',

       strategy='timestamp',
       updated_at='last_updated',
   )
}}

-- when table not contain the timestamp column, then use  strategy = check,check_cols=['col1','col2']


select *  from DEMO.PUBLIC.stock

{% endsnapshot %}

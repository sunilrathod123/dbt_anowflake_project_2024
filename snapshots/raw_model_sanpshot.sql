 -- dubplicate record not allowd in unique_key='EMPLOYEE_ID'
 -- when this column chnages then it will update updated_at='HIRE_DATE'
 
 
-- by using snapshot we can achive scd type 2
-- by using incremental load delete and insert we can achive scd type1
 
 {% snapshot raw_model_snapshot %}

{{
   config(
       target_database= 'DEMO',
       target_schema='FINAL_DATA_SCHEMA',
       unique_key='EMPLOYEE_ID',

       strategy='timestamp',
       updated_at='HIRE_DATE',
   )
}}


select * from {{ ref('employee_raw_sanpshot') }}

{% endsnapshot %}
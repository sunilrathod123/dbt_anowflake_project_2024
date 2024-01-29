 -- dubplicate record not allowd in unique_key='EMPLOYEE_ID'
 -- when this column chnages then it will updateupdated_at='HIRE_DATE'
 
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
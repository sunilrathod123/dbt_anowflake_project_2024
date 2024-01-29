 {% snapshot empployee_sanpshot %}

{{
   config(
       target_database= 'DEMO',
       target_schema='FINAL_DATA_SCHEMA',
       unique_key='EMPLOYEE_ID',

       strategy='timestamp',
       updated_at='HIRE_DATE',
   )
}}


select * from DEMO.PUBLIC.EMPLOYEE

{% endsnapshot %}
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

-- for snapshot :: unique_key=unique column, strategy='timestamp', updated_at=timestamp_column
-- create the table as name of sanpshot in snowfalke
-- command:  dbt snapshot

-- when table not contain the timestamp column, then use  strategy = check,check_cols=['col1','col2']
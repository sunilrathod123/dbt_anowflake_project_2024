
{{ config(
    materialized='view',
    schema='MY_VIEW',   
    database='DEMO'  
)}}

  SELECT * FROM DEMO.PUBLIC.STOCK

with source as (
 
 select * from DEMO.PUBLIC.LPL_TABLE
)



 select 
   *,
  'dummy' as dummy_column,
   '' as empty_col,  NULL AS Null_col


from source


-- dbt run --models +secadv_bodsql >>to run the previous depended module

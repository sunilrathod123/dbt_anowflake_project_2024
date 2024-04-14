select 
    *,
   {{row_num()}}
 from DEMO.PUBLIC.NEW_TABLE_FROM_SNOWPARK
    qualify rn=1
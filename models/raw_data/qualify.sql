select 
    *,
    row_number()over(partition by CATEGORY order by PRICE ) as rn 
 from DEMO.PUBLIC.NEW_TABLE_FROM_SNOWPARK {{qualif(2)}}

 -- macro used here {{qualif(2)}}
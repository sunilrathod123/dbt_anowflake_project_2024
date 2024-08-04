select 
    *,
    row_number()over(partition by DEPARTMENT order by SALARY ) as rn 
 from DEMO.PUBLIC.LPL_TABLE  {{qualif(2)}}

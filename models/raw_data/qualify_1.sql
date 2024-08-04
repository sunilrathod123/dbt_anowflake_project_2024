
select 
    *,
    row_number()over(partition by DEPARTMENT order by SALARY,id ) as rn 
 from DEMO.PUBLIC.LPL_TABLE QUALIFY rn<=2 order by  SALARY 

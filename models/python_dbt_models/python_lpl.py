# import snowflake.snowpark.functions as snow
from snowflake.snowpark.functions import *
from snowflake.snowpark.window import *




def model(dbt,session):
    
    dbt.config(materialized="table")
    df_query_result=dbt.ref("lpl_raw")

    as_of_Date='2024-04-15:jlkjlkj'

#udf creatd
    @udf
    def date_format(as_of_Date:str) ->str:
       return as_of_Date.split(":")[0]
    
    
    df_query_result=df_query_result.with_column("as_of_date",date_format(lit(as_of_Date)))   \
                    .with_column("city_new",lit('Pune')).with_column('Full_Name',concat(col("NAME"),lit(" "),col("LAST_NAME"))) 


    df_query_result=df_query_result.fillna({"DOB":2024-10-10,"SALARY":15000,"age":20})     

    df_query_result=df_query_result.with_column("add_value",lit("hii")) 

   # df_query_result=df_query_result.group_by("TRANSACTION").agg(sum(col("salary")))  

    df_query_result=df_query_result.filter((col("salary")>=55000) & (col("DEPARTMENT").isin("Marketing","IT","HR")))      
    
    #df_query_result=df_query_result.limit(10)
    #df_query_result=df_query_result.order_by(col("age"),ascending=False)   #not working

    #df_query_result=df_query_result.select("ID","SALARY","DEPARTMENT","CITY","TIMESTAMP")

    #df_query_result=df_query_result.select_expr("id as new_id" )
   # df_query_result=df_query_result.with_column_renamed("ID","new_id").drop("city")
    df_query_result=df_query_result.with_column("status", when(col('DEPARTMENT')=="HR",lit("My_HR")).   \
                                                          when(col('DEPARTMENT')=="Marketing",lit("My_Marketing")).  \
                                                          when(col('DEPARTMENT')=="IT",lit("My_IT"))  \
                                                          .otherwise("Nothing"))
    

    #df_query_result=df_query_result.filter(col("GENDER").like("Ma%"))
    #df_query_result=df_query_result.filter(col("GENDER").startswith("Ma"))
    df_query_result=df_query_result.with_column("new_city",substr(col("city"),1,3))

    df_query_result=df_query_result.with_column("mega_comcat",concat_ws(lit(' '),"TRANSACTION","CITY_NEW","ADD_VALUE")  )

    
#chnage data type >>decimaltype>>stringtype>>>integertype>>

#arraytype, #maptype  ## structtype  #datetype


    df_query_result=df_query_result.with_column("ID",col("id").cast("decimal(10,5)"))   \
                                   .with_column("cast_Sal",col("SALARY").cast("string"))




#window function

    win_Sapce=Window.partition_by("DEPARTMENT").order_by("SALARY")

    df_query_result=df_query_result.with_column("rn",row_number().over(win_Sapce))  

    df_query_result=df_query_result.with_column("rak",rank().over(win_Sapce))  

    df_query_result=df_query_result.with_column("dense_rank",dense_rank().over(win_Sapce))   
###
    space=Window.partition_by("DEPARTMENT").order_by("DEPARTMENT")
    space_r=Window.partition_by("DEPARTMENT").order_by("DOB").rowsBetween(Window.unboundedPreceding, Window.currentRow)    ####imp usful with sum
    space_following=Window.partition_by("DEPARTMENT").order_by("DOB").rowsBetween(Window.unboundedPreceding, Window.unboundedFollowing)



    df_query_result=df_query_result.select("NAME","LAST_NAME","DOB","SALARY","DEPARTMENT","CAST_SAL")          \
    .with_column("cumulative_sum",sum("SALARY").over(space)).sort(col("cumulative_sum").desc())


    

    df_query_result=df_query_result.select("NAME","LAST_NAME","DOB","SALARY","DEPARTMENT","CAST_SAL")          \
    .with_column("running_sum",sum("SALARY").over(space_r))

    df_query_result=df_query_result         \
    .with_column("running_avg",avg("SALARY").over(space)).with_column("running_min",min("SALARY").over(space_following))


#sum>>rowsBetween(Window.unboundedPreceding, Window.currentRow)  and rowsBetween(Window.unboundedPreceding, Window.unboundedFollowing)

#min and max>>rowsBetween(Window.unboundedPreceding, Window.unboundedFollowi

########lead and lag  # don't use rowsBetween with lead and lag

    space_lag=Window.partition_by("DEPARTMENT").order_by("SALARY")
    df_query_result=df_query_result         \
    .with_column("lag",lag("SALARY",1,0).over(space_lag)).with_column("lead",lead("SALARY",1,0).over(space_lag))


###############################   group by

    df_query_result=df_query_result.group_by("DEPARTMENT").agg(sum("SALARY").alias("total_sum"),min("SALARY")     \
                                               .alias("min_Sal"),avg("SALARY").alias("avg_Sal")  \
                                               ,count("SALARY").alias("count" ))


    return df_query_result   




  

   
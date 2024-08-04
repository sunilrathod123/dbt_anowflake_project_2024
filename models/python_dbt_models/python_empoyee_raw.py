# import snowflake.snowpark.functions as snow
from snowflake.snowpark.functions import *
from snowflake.snowpark.window import *




def model(dbt,session):
    
    # dbt.config(materialized="table")

    # define python function and use it in dataframe
    @udf
    def status(dep:str) ->str:
        if dep=="HR":
            return "yes"
        else:
            return "no"
        

    @udf
    def full_name(name:str,surname:str) ->str:
         
        return f"{name} {surname}"  
    

    @udf
    def status_new(dep:str) ->str:
        
            return "yes" if dep=="IT" else "no"
        
    
#we can use if and else 




    df_query_result=dbt.ref("employee_raw")

    df_query_result=df_query_result.withColumn("new_date",current_date()).withColumn("process",lit("process")) \
    .withColumn("name",lit("sunil")).with_column("status",status(col("DEPARTMENT")))      \
    .with_column('full_name_new',full_name(col("NAME"),col("LAST_NAME"))).with_column("status_new",status_new(col("DEPARTMENT")))


    df_query_result=df_query_result.with_column("win",rank().over(Window.partition_by("department").order_by('ID')))
    df_query_result=df_query_result.filter(col("win")==1).drop("win")
    # df_query_result=df_query_result.filter(col("DEPARTMENT")=="Sales")

    ages_to_exclude = [35]
    df_query_result = df_query_result.filter(not_(col("age").isin(ages_to_exclude)))


    

    return df_query_result



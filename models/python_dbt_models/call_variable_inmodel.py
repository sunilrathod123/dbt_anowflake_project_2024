from snowflake.snowpark.functions import *
from snowflake.snowpark.window import *

def model(dbt, session):

# # Get the variable  value from my_schema.yml fle
    dd_value = dbt.config.get("dd")  
    todays = dbt.config.get("todayss") 
    as_of_date_ = dbt.config.get("as_of_date")

    statuss = dbt.config.get("statuss")

    # Load the reference table 'lpl_raw'
    df_query=dbt.ref("lpl_raw")
   
   

    
    df_query_result = df_query.withColumn("new_Date", lit(dd_value)).withColumn("nDate", lit(todays)) 
                                    
    
    if statuss== "ON":            #working
       df_query_result=df_query.withColumn("new_Date", lit(dd_value))
    
    
    

    return df_query_result

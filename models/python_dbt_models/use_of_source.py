
from snowflake.snowpark.functions import *
from snowflake.snowpark.window import *

def model(dbt, session):
   #define materialization here
   dbt.config(materialized="table")

#we can use table details from source.yml file, use of source(working)
   df= dbt.source("raw_data_source", "lpl")
#we can call the model using ref.   
   dd=query_result = dbt.ref("lpl_raw")  

   return df
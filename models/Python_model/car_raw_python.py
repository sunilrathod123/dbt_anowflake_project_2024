#import snowflake.snowpark.functions as f

from snowflake.snowpark.functions import *



def model(dbt,session):
    
    dbt.config(materialized="table")
    Store=dbt.ref("car_raw")


    final_df=Store.select(col("ID"),col("COMPANY_MANUFACTURER"),col("CAR_MODEL"))

    #d=Store.filter(f.col("COMPANY_MANUFACTURER")=="Hyundai")
    

    return final_df
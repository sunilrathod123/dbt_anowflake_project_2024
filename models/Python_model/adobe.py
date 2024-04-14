from snowflake.snowpark.functions import *



def model(dbt,session):
    
    dbt.config(materialized="table")
    df=session.sql("select * from DEMO.PUBLIC.MANIFEST_FILE limit 10")

    

    return df






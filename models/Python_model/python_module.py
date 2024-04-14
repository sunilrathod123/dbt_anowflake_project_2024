import snowflake.snowpark.functions as f



def model(dbt,session):
    
    dbt.config(materialized="table")
    Store=dbt.ref("car_raw")

    d=Store.filter(f.col("COMPANY_MANUFACTURER")=="Hyundai")
    

    return d
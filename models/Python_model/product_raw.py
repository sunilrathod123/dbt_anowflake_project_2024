from snowflake.snowpark.functions import *


def model (dbt,session):
  
#we can readthe data from snowflake directly using the sql query
  
  df_sql = session.sql("select * from DEMO.PUBLIC.PRODUCT")
  df1=df_sql.select(col("PRODUCT_NAME"),col("PRICE"),col("CATEGORY"))

  df1=df1.filter(col("CATEGORY").startswith("E") | col("CATEGORY").startswith("S")).distinct()



  return df1
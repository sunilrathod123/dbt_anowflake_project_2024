from snowflake.snowpark.functions import *
from snowflake.snowpark.window import *

def model(dbt, session):

   # statuss = dbt.config.get("statuss")

    # Load the reference table 'lpl_raw'
    df_query=dbt.ref("sales_source")

    df_query = df_query.select('ID', 'PRODUCT_NAME', 'Quantity', 'Price') 

    #we can add filter here which month data need to process
                    

    df_query=df_query.with_column("process_date",current_timestamp()) 

    return df_query
    
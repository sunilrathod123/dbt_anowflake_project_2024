# import snowflake.snowpark.functions as snow
from snowflake.snowpark.functions import *
from snowflake.snowpark.window import *




def model(dbt,session):

    as_of_date="2024-04-18"
    process_date="2024-20-20"

    @udf
    def check_date(as_of_date:str, process_date:str) ->str:
        if not as_of_date:
            return process_date
        
        else:
            return as_of_date

   
    df_query_result=dbt.ref("refine_secadv_bodsql_temp")

    df_query_result=df_query_result.filter(col("City").isin("New York","Dalls","Houston","Chicago"))

    df_query_result=df_query_result.with_column("date_format", lit(as_of_date))  \
                   .with_column("added_date",check_date(lit(as_of_date),lit(process_date)) )

    return df_query_result
    
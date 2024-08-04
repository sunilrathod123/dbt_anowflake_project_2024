from snowflake.snowpark.functions import *
from snowflake.snowpark.window import *




def model(dbt,session):

    df=session.create_dataframe([("process_date","Null")], schema=["as_of","process"]  )

    df_query_result=dbt.ref("python_lpl")

    final_df=df.cross_join(df_query_result)

    


    return final_df
    
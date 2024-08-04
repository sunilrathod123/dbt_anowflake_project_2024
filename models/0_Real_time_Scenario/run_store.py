from snowflake.snowpark.functions import *

def model(dbt, session):
    # Load the sales data
    sales_dataframe = session.table("Demo.public.SALES")
    sales_dataframe.show()


    order_dataframe = session.table("order_date_record")
    order_dataframe.show()


    join_df = sales_dataframe.join(order_dataframe, sales_dataframe["PRODUCT_ID"] == order_dataframe["ORDER_ID"], "inner")
    join_df = join_df.with_column("new_date", current_date())


    join_df.write.mode("overwrite").save_as_table('demo.snowpark.snow_table')

  
    print('Table written to demo.snowpark.snow_table')
    
 
    return join_df

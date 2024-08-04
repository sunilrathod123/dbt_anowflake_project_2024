from snowflake.snowpark.functions import *
from snowflake.snowpark.window import *
from datetime import datetime,date
import calendar
from datetime import datetime, timedelta






def model(dbt, session):


# vvimp we can create the udf for date
    @udf
    def current_date() ->date:
        return date.today()
    
    @udf
    def current_timestamps() ->str:
        return datetime.now()
    

    @udf
    def last_day_of_month() ->date:
        current_date = datetime.now().date()
        year = current_date.year
        month = current_date.month
        
        num_days_in_month = calendar.monthrange(year, month)[1]
        
        last_day = datetime(year, month, num_days_in_month)
        while last_day.weekday() > 4:
            last_day -= timedelta(days=1)
        return last_day


    
    
        

    # Get sql_date from dbt config (assuming it's defined in YAML)
    date_From_variable = dbt.config.get("as_of_date_s")                # vvimp its working we can call variable 
    dd_value = dbt.config.get("dd")  

    df_query_result=dbt.ref("lpl_raw")

    df_query_result=df_query_result.with_column("date",current_date()).                     \
                                   with_column("timestamp",current_timestamps()).            \
                                   with_column("last_Date",last_day_of_month()).      \
                                   with_column("add",lit(dd_value)).                       \
                                   with_column("new_Date",lit(date_From_variable))
    

    
    return df_query_result

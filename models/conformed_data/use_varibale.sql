select *, {{var("process_date")}} as date from {{ source('raw_data_source', 'EMP') }}

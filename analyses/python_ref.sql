-- analysis the python file
-- we just see the result after running python dbt run file  :: dbt run -m python_file


select * from {{ ref('python_empoyee_raw') }}



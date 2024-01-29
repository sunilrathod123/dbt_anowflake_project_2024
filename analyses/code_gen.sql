
{{ codegen.generate_source(
    name ='suni_sourcename',
    schema_name ='PUBLIC',
    database_name ='DEMO',
    table_names =['CHECK_NUMBER','COUNTRY','CUSTOMER_NEW'],
    include_descriptions =TRUE,
    include_database =TRUE,
    include_schema =TRUE
   

) }}
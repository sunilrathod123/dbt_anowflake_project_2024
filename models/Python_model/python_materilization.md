    dbt.config(materialized = "incremental")

     dbt.config(materialized="table")


       # DataFrame representing an upstream model
    upstream_model = dbt.ref("upstream_model_name")

    # DataFrame representing an upstream source
    upstream_source = dbt.source("upstream_source_name", "table_name")

    
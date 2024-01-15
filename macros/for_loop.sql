-- models/my_model.sql

{% set tables = ["table1", "table2", "table3"] %}

{% for table in tables %}
    {{ config(
        materialized='table',
        unique_key='id',
        table_name='my_model_' ~ table
    ) }}

    with source as (
        select * from {{ ref(table) }}
    )

    select *
    from source
{% endfor %}

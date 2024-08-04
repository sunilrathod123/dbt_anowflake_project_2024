{{ config(materialized='ephemeral') }}

-- vvimp use this materialized it will not create any views or table in snowflake

select * from {{ ref('FIRST_TABLE') }}

-- drop this intermediant table using on rn end hook which is defined in dbt_project.yml file
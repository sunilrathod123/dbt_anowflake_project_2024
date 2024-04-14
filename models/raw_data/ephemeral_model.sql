-- not create table or view in snowflake
-- we can use this model as ref in other model

{{
  config(
    materialized = 'ephemeral',
    )
}}


with source as (


select * from {{ source('source_public_schema', 'custmer') }}

)

select * FROM source

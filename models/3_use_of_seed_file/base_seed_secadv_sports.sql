with source as (
      select * from {{ source('seed_secadv', 'sports') }}
),
renamed as (
    select
        {{ adapter.quote("MYCOUNRTY") }},
        {{ adapter.quote("MY_SPORTS") }}

    from source
)
select * from renamed
  
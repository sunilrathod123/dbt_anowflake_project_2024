
{% snapshot sales_order_snap %}

{{
   config(
       target_database='DEMO',
       target_schema='new_snapshot',
       unique_key='ID',

       strategy='timestamp',
       updated_at='updated_at',
   )
}}


select *,current_timestamp() as updated_at  from sales_order

{% endsnapshot %}

-- normal variable can access below is syantax
-- select '{{ var("todayss") }}' as 



-- vvimp folowing working access variable from .yml.>> before we are called macro

select {{ var("as_of_date_s") }}::date as vvv
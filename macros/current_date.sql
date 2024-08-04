{% macro get_current_date() %}
    current_date()
{% endmacro %}


-- call in model >> select   {{ get_current_date()  }} as dac

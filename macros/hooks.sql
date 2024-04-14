{# WE CAN USE MACRO AS HOOKS #}

{% macro insert_record(fill)%}

 insert into DEMO.PUBLIC.RAW_EMP (name)
  values ({{fill}});
  
{% endmacro %}
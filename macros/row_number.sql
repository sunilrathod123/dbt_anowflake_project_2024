{% macro row_num() %}
  
 row_number()over(partition by CATEGORY order by PRICE ) as rn 

{% endmacro %}
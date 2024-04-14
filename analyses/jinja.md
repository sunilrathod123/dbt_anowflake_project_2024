we can use if..else, foor loop

#create variable 
{% set value=123 %}

#create variable 
{%- set value=123 -%}  - remove white spaces


#use variable
{{value}}
.........................................for loop

{%- countrty=['ind','japan','uk']-%}

{%- for i in country -%}
  my countrty is {{i}} 
{% endfor %}
{% set my_list=['english','maths','hindi','history'] %}

{{my_list[0]}}
{{my_list[2]}}


{% for i in my_list %}

my fav subject is {{i}}
{% if not loop.last %}
   ,
{% endif %}   

{% endfor %}



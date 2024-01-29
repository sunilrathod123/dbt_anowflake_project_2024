

{% set foods=['mango','apple','banana','chiku','dosa']%}

{% for i in foods %}

  {% if i=='apple'%}

     my fav food is {{i}}
  {% else %} 
      my fav is other
  {% endif %}      

{% endfor%}
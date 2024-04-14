use of control structure in sql
for creating macros
used for generic test

###set variable
{% set value=123%}

##use of variable

{{value}}

####################################

{-% set list=["america","japan","india","french"]  %-}

{% for i in list %}

{{i | capitalize}}

{% endfor %}
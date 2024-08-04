...................we create the macro in macros folder and call then in model by macro name


dbt run -operation macro_name    >>>>>>to run macro

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
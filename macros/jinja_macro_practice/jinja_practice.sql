{#

--  set variable
{% set my_string= 'sunil rathod'%}


-- use variable
{{my_string}}   


#}
{% set my_string= 'sunil rathod'%}



{{my_string}}   



{- % set list=["america","japan","india","french"]  %-}

{% for i in list %}

{{i |capitalize}}

{% endfor %

-- ----

{%- set my_score=50 -%}
{%- set passing_Score=40 -%}

{%- if my_score>passing_Score -%}
you have passed
{%- else -%}
you have failed
{%- endif -%}

-- ------
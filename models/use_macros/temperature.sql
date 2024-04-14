{% set temperature = 45 %}

{% if temperature < 60 %}
    {{ 'Its too low' }}
{% else %}
    {{ "It's too high" }}
{% endif %}
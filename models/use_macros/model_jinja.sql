
{% set dep=["HR", "Finance"] %}

SELECT 
  
    {% for i in dep %}
        SUM(CASE WHEN DEPARTMENT='{{ i }}' THEN salary ELSE 0 END) AS {{ i }}_sal
        {% if not loop.last %},{% endif %}
    {% endfor %}
FROM  
    DEMO.PUBLIC.EMPLOYEE 
GROUP BY 
    DEPARTMENT

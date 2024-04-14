{% macro get_column_list(table_name) %}
  SELECT column_name
  FROM information_schema.columns
  WHERE table_name = '{{ table_name }}'
  ORDER BY ordinal_position;

  -- Loop through results and build comma-separated list
  {% set columns = [] %}
  {% for row in result %}
    {% set columns.append(row.column_name) %}  {% endfor %}
  {{ ",".join(columns) }}
{% endmacro %}

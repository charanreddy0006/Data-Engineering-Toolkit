{% macro normalize_vehicle_id(column_name) %}
upper(trim({{ column_name }}))
{% endmacro %}

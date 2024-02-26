{% macro grant_select(role) %}

{% set sql %}
    grant usage on database {{ target.database }} to role {{ role }};
    grant usage on schema {{ target.schema }} to role {{ role }};
    grant select on all tables in schema {{ target.schema }} to role {{ role }};
    grant select on all views in schema {{ target.schema }} to role {{ role }};
    grant usage on warehouse compute_wh to role {{ role}};
{% endset %}

{% do run_query(sql) %}
{% do log("Privileges granted", info=True) %}
{% endmacro %}

To invoke this macro as an operation, execute dbt run-operation grant_select --args '{role: reporter}'.

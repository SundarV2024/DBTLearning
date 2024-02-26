{% macro get_order_linenos() -%}

{% set distinct_linenos_query %}
select distinct
lineno
from {{ ref('trf_orderdetails') }}
order by 1
{% endset %}

{% set results = run_query(distinct_linenos_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}

{% macro get_order_min() -%}

{% set min_orderdate_query %}
select 
min(orderdate)
from {{ ref('trf_orders') }}
{% endset %}

{% set results = run_query(min_orderdate_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}

{% macro get_order_max() -%}

{% set max_orderdate_query %}
select 
max(orderdate)
from {{ ref('trf_orders') }}
{% endset %}

{% set results = run_query(max_orderdate_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}
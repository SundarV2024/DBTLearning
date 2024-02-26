{{ config(materialized = 'view', schema = 'salesmart') }}

{% set minorderdate = get_order_min() %}
{% set maxorderdate = get_order_max() %}

{{ dbt_date.get_date_dimension(minorderdate,maxorderdate) }}
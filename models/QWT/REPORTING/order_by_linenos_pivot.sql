{{ config(materialized = 'view', schema = 'reporting')}}

{#  {% set linenos = [1,2,3] %}  #}
{% set linenos = get_order_linenos() %}

select

orderid,

{% for lineno in linenos %}

sum(case when lineno = {{lineno}} then linesalesamount end) as line{{lineno}}_amount,

{% endfor %}

sum(linesalesamount) as totalsales

{# 
sum(case when lineno = 1 then linesalesamount end) as lineno1_amount,
sum(case when lineno = 2 then linesalesamount end) as lineno2_amount,
sum(case when lineno = 3 then linesalesamount end) as lineno3_amount,
sum(linesalesamount) as totalsales
#}

from {{ref('trf_orderdetails')}}

group by 1
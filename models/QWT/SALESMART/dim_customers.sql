{{ config(materialized = 'view', schema = 'salesmart')}}

select
c.*,
d.divisionname

from

{{ ref('trf_customers')}} as c

inner join

{{ ref('divisions')}} as d

on c.divisionid = d.divisionid
{{ config(materialized = 'table')}}

select *
from
{{env_var('DBT_SOURCEDB', 'QWT')}}.{{env_var('DBT_SOURCESCHEMA', 'RAW')}}.employee
-- qwt.raw.employee
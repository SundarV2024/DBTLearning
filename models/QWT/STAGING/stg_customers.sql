{{ config (materialized = 'table', sort = 'customerid', alias = 'stg_customers') }}
 
select * from
{{env_var('DBT_SOURCEDB', 'QWT')}}.{{env_var('DBT_SOURCESCHEMA', 'RAW')}}.Customer
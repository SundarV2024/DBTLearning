{{ config(materialized = 'table', schema = 'TRANSFORMING', sql_header = 'create warehouse loading_wh;')}}

select 
CUSTOMERID,
COMPANYNAME,
CONTACTNAME,
CITY,
COUNTRY,
DIVISIONID,
ADDRESS,
FAX,
PHONE,
POSTALCODE,
(case when trim(StateProvince)='' then 'NA' else StateProvince end) as StateProvince
from 
{{ ref ('stg_customers')}}
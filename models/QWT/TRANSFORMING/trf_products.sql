{{ config(materialized = 'table', schema = 'TRANSFORMING')}}

select
*,
iff((UnitsInStock-UnitsOnOrder) > 0, 'Yes','No') as productavailability,
to_double(UnitPrice - UnitCost) as Profit
from 
{{ ref ('stg_products')}}
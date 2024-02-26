{{ config(materialized = 'table', schema = 'transforming') }}

select 
OD.*,

(OD.UnitPrice * OD.Quantity) * (1-OD.DISCOUNT) as linesalesamount,
p.UnitCost * OD.Quantity as costofgoodssold,
((OD.UnitPrice * OD.Quantity) *(1 - OD.Discount)) - (p.UnitCost * OD.Quantity) as margin

from

{{ref('stg_orderdetails')}} od

inner join {{ref('stg_products')}} p

on OD.productid = p.productid
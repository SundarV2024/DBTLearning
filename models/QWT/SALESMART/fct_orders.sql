{{ config(materialized = 'view' , schema = 'salesmart') }}

select
OD.*,
O.orderdate,
O.ordermonth,
O.orderyear,
O.customerid,
O.employeeid,
O.freight

from

{{ ref('trf_orders') }} as O inner join {{ ref('trf_orderdetails')}} as OD
on 
O.OrderID = OD.OrderID

{{ config(materialized = 'view', schema = 'salesmart') }}

select
SS.orderid,
SS.LineNo,
SS.ShipmentDate,
SS.Status,
SS.valid_from,
SS.valid_to,
S.companyname

from

{{ ref('trf_shipments_snapshot') }} as SS

inner join

{{ ref('shippers') }} as S

on
SS.shipperid = S.shipperid
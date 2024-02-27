{{ config (materialized = 'table') }}
 
select 
OrderID,
LineNo,
ShipperID,
CustomerID,
ProductID,
EmployeeID,
date(split_part(ShipmentDate, ' ', 1)) as ShipmentDate,
-- split_part(ShipmentDate, ' ',1)::date as Shipmentdate
Status
from
{{env_var('DBT_SOURCEDB', 'QWT')}}.{{env_var('DBT_SOURCESCHEMA', 'RAW')}}.shipments
---QWT.RAW.shipments

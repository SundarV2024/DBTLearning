{{ config(materialized = 'incremental', unique_key = 'OrderID, LineNo') }}

select 
OD.OrderID,
OD.LineNo,
OD.ProductID,
OD.Quantity,
OD.UnitPrice,
OD.Discount

from

{{env_var('DBT_SOURCEDB', 'QWT')}}.{{env_var('DBT_SOURCESCHEMA', 'RAW')}}.Orderdetails OD inner join {{env_var('DBT_SOURCEDB', 'QWT')}}.{{env_var('DBT_SOURCESCHEMA', 'RAW')}}.Orders O
---QWT.RAW.Orderdetails OD inner join QWT.RAW.Orders O
on
O.OrderID = OD.OrderID

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where O.orderdate > (select max(O.orderdate) from {{ this }})

{% endif %}
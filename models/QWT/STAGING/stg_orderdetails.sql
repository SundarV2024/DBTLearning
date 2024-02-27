{{ config(materialized = 'incremental', unique_key = ['OrderID', 'LineNo']) }}

select 
OD.*

from

{{ref('stg_orders')}} as O 
inner join 
{{env_var('DBT_SOURCEDB', 'QWT')}}.{{env_var('DBT_SOURCESCHEMA', 'RAW')}}.Orderdetails as OD
---QWT.RAW.Orderdetails as OD
on
O.OrderID = OD.OrderID

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where orderdate >= (select max(orderdate) from {{ref ('stg_orders')}})

{% endif %}
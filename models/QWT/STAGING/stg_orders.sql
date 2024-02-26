{{ config(materialized = 'incremental', unique_key = 'OrderID') }}

select *

from

{{env_var('DBT_SOURCEDB', 'QWT')}}.{{env_var('DBT_SOURCESCHEMA', 'RAW')}}.Orders
--QWT.RAW.Orders

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where orderdate > (select max(orderdate) from {{ this }})

{% endif %}

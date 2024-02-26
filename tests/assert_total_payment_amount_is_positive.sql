select productid,
sum(profit) as totalprofit
from
{{ ref('trf_products') }}
group by productid
having totalprofit < 0

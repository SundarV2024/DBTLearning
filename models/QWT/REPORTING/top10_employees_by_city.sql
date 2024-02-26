{{config(materialized='view', schema ='reporting')}}

select 
E.firstname,
sum(OD.linesalesamount) as totalsales,
avg(OD.margin) as profit

from

{{ ref('stg_employee') }} as E 
inner join {{ ref('stg_office') }} as O
on E.office = O.office

inner join {{ ref('fct_orders')}} as OD
on OD.employeeid = E.empid

where o.officecity = '{{ var('city','Paris') }}'

group by E.firstname, OD.ordermonth, OD.orderyear

order by totalsales desc
limit 10
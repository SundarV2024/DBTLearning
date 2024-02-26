{{ config(materialized = 'table', schema = 'transforming') }}

select
E.empid,
E.firstname,
E.lastname,
E.title,
E.hiredate,
O.officecity,
concat(EE.firstname || ' ' || EE.lastname) as managername,
E.yearsalary
from
{{ ref('stg_employee')}} as E
inner join {{ ref('stg_employee')}} as EE
inner join {{ ref('stg_office')}} as O
on
E.empid = EE.reportsto and
O.office = E.office 
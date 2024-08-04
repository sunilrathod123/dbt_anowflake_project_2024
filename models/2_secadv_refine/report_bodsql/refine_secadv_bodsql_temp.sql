select
  id,
  DEPARTMENT,
  CITY,
  sum(SALARY) as total_sal,
  
  count(1) as total_rows,
  '' as new_added
from {{ ref("secadv_bodsql") }}
where 1=1 and dummy_column is not null
group by id,DEPARTMENT,CITY

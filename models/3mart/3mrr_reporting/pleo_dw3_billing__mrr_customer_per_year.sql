select
  date_trunc(report_date,year) as report_year
  ,customer_id
  ,currency
  ,sum(amount_per_day) as amount
  ,sum(amount_eur_per_day) as amount_eur
from
  {{ ref('pleo_dw3_billing__mrr_customer_per_day') }}
group by 
  1,2,3
order by 1
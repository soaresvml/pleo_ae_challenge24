with 
invoice_items as
(
  select 
    * 
    ,date_diff(period_end,period_start,day) as period_days
  from 
    {{ref('pleo_dw1_billing__invoice_item')}}
)
,
invoice as 
(select * from {{ref('pleo_dw1_billing__invoice')}})
,
joined as
(
  select
    inv.customer_id
    ,ini.invoice_id
    ,ini.type
    ,ini.period_end
    ,ini.period_start
    ,ini.period_days
    ,ini.amount
    ,safe_divide(ini.amount,ini.period_days) as amount_per_day
    ,ini.currency
    ,ini.amount_eur
    ,safe_divide(ini.amount_eur,ini.period_days) as amount_eur_per_day
  from
    invoice inv
    left join invoice_items ini on ini.invoice_id=inv.id
  where 
    ini.type='subscription'
)
select
  *
from 
  joined
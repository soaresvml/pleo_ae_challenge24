with 
invoice_items as
(
  select 
    * 
    ,date_sub(cast(date_trunc(period_end,month) as date), interval 1 month) as billing_period_month
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
        ini.id as invoice_item_id
        ,inv.customer_id
        ,ini.invoice_id
        ,ini.type
        ,ini.billing_period_month
        ,ini.period_start
        ,ini.period_end
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
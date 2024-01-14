with
max_date_challenge as
(
    select 
        cast(max(period_start) as date) as max_period_month
        ,cast(min(period_start) as date) as min_period_month 
    from 
        {{ref('pleo_dw2_billing__mrr_invoice_items')}}
)
,
dates as
(
    select
        *
    from
        unnest(
            generate_date_array(
            (select min_period_month from max_date_challenge)
            ,(select max_period_month from max_date_challenge)
            ,interval 1 day
            )
        ) as report_date
)
,
customers as 
(select distinct customer_id from {{ref('pleo_dw2_billing__mrr_invoice_items')}})
,
dates_customers_base as
(
  select * from dates cross join customers
)
-- TEST OF BASE OF DATES AND CUSTOMER ID
-- select * from dates_customers_base order by 1 desc
,
invoices as
(select * from {{ref('pleo_dw2_billing__mrr_invoice_items')}} )
,
final as
(
  select
    dcb.* 
    ,last_value(invoice_id ignore nulls) over (partition by dcb.customer_id order by dcb.report_date rows between unbounded preceding and current row) as invoice_id
    ,last_value(amount_per_day ignore nulls) over (partition by dcb.customer_id order by dcb.report_date rows between unbounded preceding and current row) as amount_per_day
    ,last_value(currency ignore nulls) over (partition by dcb.customer_id order by dcb.report_date rows between unbounded preceding and current row) as currency
    ,last_value(amount_eur_per_day ignore nulls) over (partition by dcb.customer_id order by dcb.report_date rows between unbounded preceding and current row) as amount_eur_per_day
    -- ,inv.* except(customer_id) 
  from
    dates_customers_base dcb
    left join invoices as inv on dcb.report_date=inv.billing_period_month and dcb.customer_id=inv.customer_id
  -- MRR per day report will support only 180 days, 6 months, of data per Customer
  qualify row_number() over (partition by customer_id order by report_date desc) <= 180
)
select
  *
from
  final
where
  invoice_id is not null

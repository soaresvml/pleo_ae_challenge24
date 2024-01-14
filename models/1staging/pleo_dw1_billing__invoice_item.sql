with 
invoice_item as (select * from {{source('pleo_dw_billing','invoice_item')}})

select 
    *
    ,{{convert_to_eur(currency_code_col = 'currency', amount_col = 'amount')}} as amount_eur
from
    (
        {{ dbt_utils.deduplicate(relation='invoice_item',partition_by='id',order_by="_synced desc")}}
    )deduped

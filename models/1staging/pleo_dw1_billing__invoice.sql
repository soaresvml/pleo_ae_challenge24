with cleanup as
(
  select 
    string_field_0 as id
    ,string_field_1 as customer_id
  from
    {{source('pleo_dw_billing','invoice')}}
  where true
    and string_field_0<>'id'
)
select * from cleanup
    
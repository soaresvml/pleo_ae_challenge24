{% macro convert_to_eur(currency_code_col, amount_col) %}

case 
    when {{currency_code_col}} = 'dkk' then 7.45*{{amount_col}}
    when {{currency_code_col}} = 'sek' then 11.22*{{amount_col}}
    when {{currency_code_col}} = 'gbp' then 0.87*{{amount_col}}
else {{amount_col}}
end 

{% endmacro %}
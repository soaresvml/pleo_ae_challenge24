{% macro convert_to_eur(currency_code_col, amount_col) %}

case 
    when {{currency_code_col}} = 'dkk' then {{amount_col}}/7.45
    when {{currency_code_col}} = 'sek' then {{amount_col}}/11.22
    when {{currency_code_col}} = 'gbp' then {{amount_col}}*0.87
else {{amount_col}}
end 

{% endmacro %}
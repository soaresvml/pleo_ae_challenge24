{% macro rwone_dedup(relation, partition_by, order_by, nulls_order) %}

select
    *
from 
    {{ relation }}
qualify row_number() over (partition by {{ partition_by }} order by {{ order_by }} {{ nulls_order }} ) =1

{% endmacro %}
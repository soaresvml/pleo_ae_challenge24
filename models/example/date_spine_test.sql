select
    *
from
    {{ref('my_second_dbt_model')}} as msm
    cross join unnest(generate_date_array('2023-01-01', '2023-12-31',interval 1 month)) as last_year_months
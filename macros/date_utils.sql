{% macro function1(x)%}
case when to_timestamp({{x}}) < CURRENT_DATE then 'PAST'
else 'future' end

{% endmacro %}



{% macro get_season(x)%}
CASE
WHEN MONTH(to_timestamp(STARTED_AT))  IN (12,1,2) THEN 'WINTER'
WHEN MONTH(to_timestamp(STARTED_AT))  IN (3,4,5) THEN 'SPRING'
WHEN MONTH(to_timestamp(STARTED_AT))  IN (6,7,8) THEN 'SUMMER'
ELSE 'AUTUMN' END
{% endmacro %}

{% macro DAY_TYPE(x)%}
case 
when dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun')
then 'WEEKEND'
ELSE 'BUSINESSDAY'
END 
{% endmacro %} 

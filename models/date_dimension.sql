with CTE as (
SELECT 
to_timestamp(STARTED_AT) as STARTED_AT,
date(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
hour(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,
case 
when dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun')
then 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE
,
CASE
WHEN MONTH(to_timestamp(STARTED_AT))  IN (12,1,2) THEN 'WINTER'
WHEN MONTH(to_timestamp(STARTED_AT))  IN (3,4,5) THEN 'SPRING'
WHEN MONTH(to_timestamp(STARTED_AT))  IN (6,7,8) THEN 'SUMMER'
ELSE 'AUTUMN' END AS STATION_OF_YEAR
from
{{ source('demo','bike') }}
WHERE STARTED_AT != 'started_at'
)
SELECT * FROM CTE
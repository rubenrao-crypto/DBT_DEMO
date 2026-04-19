with CTE as (
SELECT 
to_timestamp(STARTED_AT) as STARTED_AT,
date(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
hour(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,
{{DAY_TYPE('STARTED_AT')}} AS DAY_TYPE
,

{{get_season('STARTED_AT')}} AS STATION_OF_YEAR
from
{{ source('demo','bike') }}
WHERE STARTED_AT != 'started_at'
)
SELECT * FROM CTE
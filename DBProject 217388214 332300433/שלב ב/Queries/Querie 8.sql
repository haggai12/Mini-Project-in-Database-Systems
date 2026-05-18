select
        EXTRACT (HOUR from fa.alert_timestamp) as hour,
        count(*) as number_of_alerts,
        round(AVG(fa.severity_level),3) as average_severity_level
from flight_alerts fa
group by EXTRACT (HOUR from fa.alert_timestamp)
order by number_of_alerts desc;
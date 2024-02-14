.mode markdown
.header on
SELECT 
    ride_id,
    rideable_type,
    member_casual,
    started_at,
    ended_at,
    ROUND(	ABS(JULIANDAY(ended_at) - JULIANDAY(started_at))*24*60, 2	) AS ride_length_min, 
    ROUND(	ABS(JULIANDAY(ended_at) - JULIANDAY(started_at))*24,1	) AS ride_length_hour,
    CASE CAST(strftime('%w',ended_at) AS INTEGER)
      when 0 then 'Sunday'
      when 1 then 'Monday'
      when 2 then 'Tuesday'
      when 3 then 'Wednesday'
      when 4 then 'Thursday'
      when 5 then 'Friday'
      else 'Saturday' end as day

FROM '202301-divvy-tripdata.csv'
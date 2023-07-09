-- Number of trips per rider type 

SELECT 
  member_casual,
  count(*) as num_of_trips
FROM
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`
group by
  member_casual
order by
  member_casual


-- Number of trips per bike type per rider type 

SELECT 
  member_casual, 
  rideable_type, 
  COUNT(*) AS num_of_trips
FROM 
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`
GROUP BY 
  member_casual, rideable_type
ORDER BY 
  member_casual, num_of_trips;


-- Average ride length per rider type

Select member_casual,
FORMAT_TIMESTAMP
  ('%T', 
  TIMESTAMP_SECONDS(CAST(AVG(TIME_DIFF(ride_length, '00:00:00', SECOND)) AS 
  INT64)))
   AS avg_ride_length

From
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`
Group By
  member_casual


-- Average ride length per month per rider type

With combined as
(SELECT 
  *, 
  extract(month from started_at) as month
FROM
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`)

Select 
  member_casual,
  month,
  FORMAT_TIMESTAMP
  ('%T', 
  TIMESTAMP_SECONDS(CAST(AVG(TIME_DIFF(ride_length, '00:00:00', SECOND)) AS 
  INT64)))
   AS avg_ride_length
From combined
group by 
  member_casual, month
order by
  member_casual, month


-- Average ride length per day per rider type

Select 
  member_casual,
  day_of_week,
  FORMAT_TIMESTAMP
  ('%T', 
  TIMESTAMP_SECONDS(CAST(AVG(TIME_DIFF(ride_length, '00:00:00', SECOND)) AS 
  INT64)))
   AS avg_ride_length
From cyclistic_2022_tripdata.combined_data
group by 
  member_casual, day_of_week
order by
  member_casual, day_of_week


-- Average ride length per hour per rider type

With combined as
(SELECT 
  *, 
  extract(hour from started_at) as hour
FROM
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`)

Select 
  member_casual,
  hour,
  FORMAT_TIMESTAMP
  ('%T', 
  TIMESTAMP_SECONDS(CAST(AVG(TIME_DIFF(ride_length, '00:00:00', SECOND)) AS 
  INT64)))
   AS avg_ride_length
From combined
group by 
  member_casual, hour
order by
  member_casual, hour


-- Number of trips per rider type

SELECT 
  member_casual,
  count(*) as num_of_trips
FROM
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`
group by
  member_casual
order by
  member_casual

  
-- Number of trips per month per rider type

With combined as
(SELECT 
  *, 
  extract(month from started_at) as month
FROM
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`)

Select
  member_casual,
  month,
  count(*) as num_of_trips
FROM  
  combined
group by
  member_casual, month
order by 
  member_casual, month


-- Number of trips per day per rider type

Select
  member_casual,
  day_of_week,
  count(*) as num_of_trips
FROM  
  cyclistic_2022_tripdata.combined_data
group by
  member_casual, day_of_week
order by 
  member_casual, day_of_week


--Number of trips per hour per rider type

With combined as
(SELECT 
  *, 
  extract(hour from started_at) as hour
FROM
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`)

Select
  member_casual,
  hour,
  count(*) as num_of_trips
FROM  
  combined
group by
  member_casual, hour
order by 
  member_casual, hour


--Most popular Start Stations per rider type

SELECT
  member_casual,
  start_station_name,
  AVG(start_lat) as start_lat,
  AVG(Start_lng) as start_lng,
  count(*) as num_of_trips
FROM
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`
group by
  member_casual, start_station_name
order by 
  member_casual, num_of_trips desc



-- Most popular end stations per rider type

SELECT
  member_casual,
  end_station_name,
  AVG(end_lat) as end_lat,
  AVG(end_lng) as end_lng,
  count(*) as num_of_trips
FROM
  `capstone-case-study-389823.cyclistic_2022_tripdata.combined_data`
group by
  member_casual, end_station_name
order by 
  member_casual, num_of_trips desc

- Data Cleaning in SQL

-Combine all tables into one table and remove all nulls - 

Select *
From ((select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202201_tripdata`)

union all
 
(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202202_tripdata`)

UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202203_tripdata`)
UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202204_tripdata`)

UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202205_tripdata`)
UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202206_tripdata`)
UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202207_tripdata`)
UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202208_tripdata`)
UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202209_tripdata`)
UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202210_tripdata`)
UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202211_tripdata`)
UNION ALL

(select
  *
From 
  `capstone-case-study-389823.cyclistic_2022_tripdata.202212_tripdata`))

WHERE 
  start_station_name is not null
  and end_station_name is not null
  and end_station_id is not null
  and start_station_id is not null
  and end_lat is not null  
  and end_lng is not null
  
  **Data saved into new table called combine_data**

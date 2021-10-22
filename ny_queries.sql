

-- Data sources for Dashboard NY City Bikes

-- new_york_bikes_by_day

SELECT
  CAST(starttime AS date) AS date,
  COUNT(*) num_trips,
  ROUND(SUM(tripduration/60),2) AS total_duration_minutes,
  COUNT(DISTINCT bikeid) AS num_bikes
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE
  CAST(starttime AS date) IS NOT NULL
GROUP BY
  date
ORDER BY
  date ASC

  -- new_york_bikes_by_day_start_station_name

  SELECT
    CAST (starttime AS date) AS date,
    start_station_name,
    COUNT(*) AS num_trips,
    COUNT(DISTINCT bikeid) AS num_distinct_bikes,
    SUM(tripduration/60) AS total_trip_dration
  FROM
    `bigquery-public-data.new_york_citibike.citibike_trips`
  GROUP BY
    date,
    start_station_name
  ORDER BY
    date DESC

    -- new_york_bikes_by_day_usertype_gender

    SELECT
      CAST(starttime AS date) AS date,
      usertype,
      gender,
      COUNT(*) AS num_trips,
      COUNT(DISTINCT bikeid) AS num_distinct_bikes,
      ROUND(SUM(tripduration/60),2) AS total_trip_dration
    FROM
      `bigquery-public-data.new_york_citibike.citibike_trips`
    WHERE
      CAST(starttime AS date) IS NOT NULL
      AND gender IN("male",
        "female")
    GROUP BY
      date,
      usertype,
      gender
    ORDER BY
      date ASC

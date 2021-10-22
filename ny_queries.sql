

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

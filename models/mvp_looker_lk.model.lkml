connection: "mvp_looker"


include: "/views/**/*.view.lkml"

datagroup: mvp_looker_datagroup {
  sql_trigger:
  SELECT
    CASE
      WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR)) BETWEEN 2 AND 6
      AND EXTRACT(HOUR FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR)) = 5
      THEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR))
      ELSE NULL
    END AS day_of_week ;;
  max_cache_age: "10 hour"
}

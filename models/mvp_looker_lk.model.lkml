connection: "mvp_looker"


include: "/views/**/*.view.lkml"

datagroup: mvp_looker_datagroup {
  sql_trigger: SELECT (EXTRACT(DAY_OF_WEEK FROM NOW())) WHERE DAY_OF_WEEK(NOW()) IN (1,2,3,4,5) AND HOUR(NOW()) - 3 IN(8) ;; #Recriara a PDT nos horários definidos.
  max_cache_age: "10 hour"
}

explore: d_main {}

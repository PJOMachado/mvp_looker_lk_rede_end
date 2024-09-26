view: dim_date {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.dim_date` ;;

  dimension: business_day {
    type: yesno
    sql: ${TABLE}.business_day ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: day_of_week {
    type: number
    sql: ${TABLE}.day_of_week ;;
  }
  dimension: day_of_week_name {
    type: string
    sql: ${TABLE}.day_of_week_name ;;
  }
  dimension: holiday {
    type: yesno
    sql: ${TABLE}.holiday ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }
  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }
  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }
  dimension: semester {
    type: number
    sql: ${TABLE}.semester ;;
  }
  dimension: week_of_year {
    type: number
    sql: ${TABLE}.week_of_year ;;
  }
  measure: count {
    type: count
    drill_fields: [month_name, day_of_week_name]
  }
}

view: f_aulas_dadas {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.fAulasDadas` ;;

  dimension: codaula {
    type: number
    sql: ${TABLE}.codaula ;;
  }
  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }
  dimension_group: dataaula {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dataaula ;;
  }
  dimension: semanaano {
    type: number
    sql: ${TABLE}.semanaano ;;
  }
  measure: count {
    type: count
  }
}

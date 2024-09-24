view: f_aulas_dadas {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.fAulasDadas` ;;

  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }
  dimension: semana_ano {
    type: number
    sql: ${TABLE}.SemanaAno ;;
  }
  dimension: taulas_dadas {
    type: number
    sql: ${TABLE}.TAulasDadas ;;
  }
  measure: count {
    type: count
  }
  dimension: primary_key {
    type: string
    sql: concat(${TABLE}.codturma,${TABLE}.SemanaAno) ;;
  }
}

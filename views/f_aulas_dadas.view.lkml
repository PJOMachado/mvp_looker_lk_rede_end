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
  measure: aulas_dadas {
    type: sum_distinct
    sql: ${TABLE}.TAulasDadas ;;
  }
  dimension: key {
    type: string
    #primary_key: yes
    sql: concat(${TABLE}.codturma,${TABLE}.SemanaAno) ;;
  }
}

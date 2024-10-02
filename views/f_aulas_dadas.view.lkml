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
  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.codturma,${TABLE}.SemanaAno) ;;
  }
  measure: count {
    type: count
  }
}

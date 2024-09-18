view: f_aulas_dadas {
  sql_table_name: `Datalake.fAulasDadas` ;;

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
    primary_key: yes
    sql: CONCAT(${TABLE}.codturma, ${TABLE}.SemanaAno) ;;
  }
}

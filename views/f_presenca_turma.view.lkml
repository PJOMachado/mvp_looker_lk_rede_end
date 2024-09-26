view: f_presenca_turma {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.fPresenca_Turma` ;;

  dimension: cod_turma {
    type: number
    sql: ${TABLE}.CodTurma ;;
  }
  dimension: med {
    type: number
    sql: ${TABLE}.Med ;;
  }
  dimension: semana_ano {
    type: number
    sql: ${TABLE}.SemanaAno ;;
  }
  measure: count {
    type: count
  }
  measure: presenca {
    type: number
    value_format_name: percent_2
    sql: avg(${TABLE}.Med) / 100 ;;
  }
}

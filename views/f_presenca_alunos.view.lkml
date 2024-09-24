view: f_presenca_alunos {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.fPresencaAlunos` ;;

  dimension: cgmkey {
    type: string
    sql: ${TABLE}.cgmkey ;;
  }
  dimension: med_atual {
    type: number
    sql: ${TABLE}.MedAtual ;;
  }
  dimension: med_passada {
    type: number
    sql: ${TABLE}.MedPassada ;;
  }
  dimension: semana_atual {
    type: number
    sql: ${TABLE}.SemanaAtual ;;
  }
  dimension: semana_passada {
    type: number
    sql: ${TABLE}.SemanaPassada ;;
  }
  measure: count {
    type: count
  }
}

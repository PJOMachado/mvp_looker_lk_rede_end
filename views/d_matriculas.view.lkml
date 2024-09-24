view: d_matriculas {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.dMatriculas` ;;

  dimension: cgmaluno {
    type: number
    sql: ${TABLE}.cgmaluno ;;
  }
  dimension: cgmkey {
    type: string
    sql: ${TABLE}.cgmkey ;;
  }
  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }
  dimension: descrsituacaomatricula {
    type: string
    sql: ${TABLE}.descrsituacaomatricula ;;
  }
  dimension: med_geral {
    type: number
    sql: ${TABLE}.MedGeral ;;
  }
  dimension: nome_aluno {
    type: string
    sql: ${TABLE}.`Nome Aluno` ;;
  }
  dimension: turma {
    type: string
    sql: ${TABLE}.Turma ;;
  }
  measure: alunos {
    type: count_distinct
    sql:${TABLE}.cgmaluno ;;
    filters: [cgmaluno: "not null"]
  }
}

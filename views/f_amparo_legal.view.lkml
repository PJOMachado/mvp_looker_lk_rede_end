view: f_amparo_legal {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.fAmparoLegal` ;;

  dimension: amparo_legal_qtd {
    type: number
    sql: ${TABLE}.Amparo_Legal_QTD ;;
  }
  dimension: cgmkey {
    primary_key: yes
    type: string
    sql: ${TABLE}.cgmkey ;;
  }
  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }
  dimension: datafim {
    type: string
    sql: ${TABLE}.datafim ;;
  }
  dimension: datainicio {
    type: string
    sql: ${TABLE}.datainicio ;;
  }
  dimension: nome_aluno {
    type: string
    sql: ${TABLE}.NOME_ALUNO ;;
  }
  dimension: semana_fim {
    type: string
    sql: ${TABLE}.SemanaFim ;;
  }
  dimension: semana_inicio {
    type: string
    sql: ${TABLE}.SemanaInicio ;;
  }
  measure: amparo_legal {
    type: sum
    sql: ${TABLE}.Amparo_Legal_QTD ;;
  }
}

view: d_matrizcurricular {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.dMatrizcurricular` ;;

  dimension: chsemanaldisciplina {
    type: number
    sql: ${TABLE}.chsemanaldisciplina ;;
  }
  dimension: coddisciplina {
    type: number
    sql: ${TABLE}.coddisciplina ;;
  }
  dimension: codmatriz {
    type: string
    sql: ${TABLE}.codmatriz ;;
  }
  dimension: codmatrizcurricular {
    type: number
    sql: ${TABLE}.codmatrizcurricular ;;
  }
  dimension: descrabrevcomposicao {
    type: string
    sql: ${TABLE}.descrabrevcomposicao ;;
  }
  dimension: descrcomposicao {
    type: string
    sql: ${TABLE}.descrcomposicao ;;
  }
  dimension: nomecursosae30 {
    type: string
    sql: ${TABLE}.nomecursosae30 ;;
  }
  measure: count {
    type: count
  }
}

view: d_turmas {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.dTurmas` ;;

  dimension: codetapamodalidade {
    type: number
    sql: ${TABLE}.codetapamodalidade ;;
  }
  dimension: codmatriz {
    type: string
    sql: ${TABLE}.codmatriz ;;
  }
  dimension: codmec {
    type: number
    sql: ${TABLE}.codmec ;;
  }
  dimension: codmodalidade {
    type: number
    sql: ${TABLE}.codmodalidade ;;
  }
  dimension: codmunicipioibge {
    type: number
    sql: ${TABLE}.codmunicipioibge ;;
  }
  dimension: codnucleoregional {
    type: number
    sql: ${TABLE}.codnucleoregional ;;
  }
  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }
  dimension: descrexpediente {
    type: string
    sql: ${TABLE}.descrexpediente ;;
  }
  dimension: descrtipoestab {
    type: string
    sql: ${TABLE}.descrtipoestab ;;
  }
  dimension: descrturno {
    type: string
    sql: ${TABLE}.descrturno ;;
  }
  dimension: descrzona {
    type: string
    sql: ${TABLE}.descrzona ;;
  }
  dimension: escola {
    type: string
    sql: ${TABLE}.Escola ;;
  }
  dimension: nomecursodet {
    type: string
    sql: ${TABLE}.nomecursodet ;;
  }
  dimension: nomemunicipio40 {
    type: string
    sql: ${TABLE}.nomemunicipio40 ;;
  }
  dimension: nomenreabrev {
    type: string
    sql: ${TABLE}.nomenreabrev ;;
  }
  dimension: turma {
    type: string
    sql: ${TABLE}.Turma ;;
  }
  measure: count {
    type: count
  }
}

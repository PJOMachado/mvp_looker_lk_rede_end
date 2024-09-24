view: d_etapa_modalidade {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.dEtapaModalidade` ;;

  dimension: codetapamodalidade {
    type: number
    sql: ${TABLE}.codetapamodalidade ;;
  }
  dimension: descretapamodalidade {
    type: string
    sql: ${TABLE}.descretapamodalidade ;;
  }
  measure: count {
    type: count
  }
}

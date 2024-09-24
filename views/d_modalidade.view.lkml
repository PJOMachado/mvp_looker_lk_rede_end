view: d_modalidade {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.dModalidade` ;;

  dimension: codmodalidade {
    type: number
    sql: ${TABLE}.codmodalidade ;;
  }
  dimension: descrmodalidade {
    type: string
    sql: ${TABLE}.descrmodalidade ;;
  }
  measure: count {
    type: count
  }
}

view: d_rls_nre {
  sql_table_name: `mpv-looker-rede-municipal.Datalake.dRLS_NRE` ;;

  dimension: cod_nucleo_regional {
    type: number
    sql: ${TABLE}.codNucleoRegional ;;
  }
  dimension: email_usuario {
    type: string
    sql: ${TABLE}.EmailUsuario ;;
  }
  measure: count {
    type: count
  }
}

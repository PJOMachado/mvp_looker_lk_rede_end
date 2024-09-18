view: d_rls_municipal {
  sql_table_name: `Datalake.dRLS_Municipal` ;;

  dimension: codmec {
    type: number
    sql: ${TABLE}.codmec ;;
  }
  dimension: email_usuario {
    type: string
    sql: ${TABLE}.EmailUsuario ;;
  }
  measure: count {
    type: count
  }
}

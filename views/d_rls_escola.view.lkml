view: d_rls_escola {
  sql_table_name: `Datalake.dRLS_Escola` ;;

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

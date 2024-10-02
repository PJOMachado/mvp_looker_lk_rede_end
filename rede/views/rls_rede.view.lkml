
view: rls_rede {
  derived_table: {
    sql: with rls as
      (
        select
          email,
          codmec,
          nivel,
          row_number() over(partition by email order by nivel desc) as key
        from
        (
          select
            EmailUsuario as email,
            codmec,
            1 as nivel
          from mpv-looker-rede-municipal.Datalake.dRLS_Escola
          union all
          select
            EmailUsuario as email,
            codmec,
            2 as nivel
          from mpv-looker-rede-municipal.Datalake.dRLS_Municipal
          union all
          select
            EmailUsuario as email,
            codNucleoRegional as codmec,
            3 as nivel
          from mpv-looker-rede-municipal.Datalake.dRLS_NRE
        )
      )
      select
        *
      from rls
      where key = 1 ;;
    datagroup_trigger: rede_datagroup
  }

  #suggestions: no

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: codmec {
    type: number
    sql: ${TABLE}.codmec ;;
  }

  dimension: nivel {
    type: number
    sql: ${TABLE}.nivel ;;
  }

  dimension: key {
    type: number
    sql: ${TABLE}.key ;;
  }

  set: detail {
    fields: [
      email,
      codmec,
      nivel,
      key
    ]
  }
}


view: f_amparo_rede {
  derived_table: {
    sql: select
      codturma,
      semana_do_ano,
      sum(amparo) as amparo
      from
      (
        select
          a.codturma,
          a.datafim,
          a.Amparo_Legal_QTD as amparo,
          d.SEMANA_DO_ANO as semana_do_ano
        from mpv-looker-rede-municipal.Datalake.fAmparoLegal as a -- 1.536.159 1.536.159
        left join mpv-looker-rede-municipal.Datalake.dCalendario as d
          on cast(a.datafim as date) = d.DATA
        )
        group by 1,2 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: codturma {
    primary_key: yes
    type: number
    sql: ${TABLE}.codturma ;;
  }

  dimension: semana_do_ano {
    type: number
    sql: ${TABLE}.semana_do_ano ;;
  }

  dimension: amparo {
    type: number
    sql: ${TABLE}.amparo ;;
  }
  measure: total_amparo {
    type: number
    sql: (select sum(far.amparo) from ${TABLE} as far) ;;
  }

  set: detail {
    fields: [
        codturma,
  semana_do_ano,
  amparo
    ]
  }
}

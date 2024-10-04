
view: f_amparo_legal_end {
  derived_table: {
    sql: select
        a.codturma,
        a.Amparo_Legal_QTD as amparo,
        d.SEMANA_DO_ANO as semana_do_ano
      from mpv-looker-rede-municipal.Datalake.fAmparoLegal as a
      left join mpv-looker-rede-municipal.Datalake.dCalendario as d
        on cast(a.datafim as date) = d.DATA ;;
    datagroup_trigger: rede_datagroup_end
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }

  dimension: amparo {
    type: number
    sql: ${TABLE}.amparo ;;
  }

  dimension: semana_do_ano {
    type: number
    sql: ${TABLE}.semana_do_ano ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.codturma,${TABLE}.semana_do_ano) ;;
  }

  measure: total_amparo {
    type: sum_distinct
    sql: ${TABLE}.amparo ;;
  }

  set: detail {
    fields: [
        codturma,
  amparo,
  semana_do_ano
    ]
  }
}

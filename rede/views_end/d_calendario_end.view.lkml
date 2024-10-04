
view: d_calendario_end {
  derived_table: {
    sql: select
        distinct
        SEMANA_DO_ANO as semana_ano,
        SEMANA_LETIVA
      from mpv-looker-rede-municipal.Datalake.dCalendario ;;
      datagroup_trigger: rede_datagroup_end
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: semana_ano {
    type: number
    sql: ${TABLE}.semana_ano ;;
  }

  dimension: semana_letiva {
    type: string
    sql: ${TABLE}.SEMANA_LETIVA ;;
  }

  set: detail {
    fields: [
        semana_ano,
  semana_letiva
    ]
  }
}

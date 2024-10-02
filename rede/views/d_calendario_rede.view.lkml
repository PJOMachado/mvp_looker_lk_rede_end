
view: d_calendario_rede {
  derived_table: {
    sql: select
        distinct
        SEMANA_DO_ANO,
        SEMANA_LETIVA
      from mpv-looker-rede-municipal.Datalake.dCalendario ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: semana_do_ano {
    type: number
    sql: ${TABLE}.SEMANA_DO_ANO ;;
  }

  dimension: semana_letiva {
    type: string
    sql: ${TABLE}.SEMANA_LETIVA ;;
  }

  set: detail {
    fields: [
        semana_do_ano,
  semana_letiva
    ]
  }
}

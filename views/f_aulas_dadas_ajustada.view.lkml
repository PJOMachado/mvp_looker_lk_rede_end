
view: f_aulas_dadas_ajustada {
  derived_table: {
    sql: select
              codturma as codturma,
              SemanaAno as semana_ano,
              sum(TAulasDadas) as aulas_dadas
            from mpv-looker-rede-municipal.Datalake.fAulasDadas
            group by 1,2 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }

  dimension: semana_ano {
    type: number
    sql: ${TABLE}.semana_ano ;;
  }

  dimension: aulas_dadas {
    type: number
    sql: ${TABLE}.aulas_dadas ;;
  }

  set: detail {
    fields: [
        codturma,
  semana_ano,
  aulas_dadas
    ]
  }
}

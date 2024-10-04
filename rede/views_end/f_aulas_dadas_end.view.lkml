
view: f_aulas_dadas_end {
  derived_table: {
    sql: select
        codturma,
        SemanaAno as semanaano,
        sum(TAulasDadas) as aulas
      from mpv-looker-rede-municipal.Datalake.fAulasDadas
      group by 1,2 ;;
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

  dimension: semanaano {
    type: number
    sql: ${TABLE}.semanaano ;;
  }

  dimension: aulas {
    type: number
    sql: ${TABLE}.aulas ;;
  }
  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.codturma,${TABLE}.semanaano) ;;
  }
  measure: total_aulas {
    type: sum
    sql: ${TABLE}.aulas ;;
  }
  set: detail {
    fields: [
        codturma,
  semanaano,
  aulas
    ]
  }
}

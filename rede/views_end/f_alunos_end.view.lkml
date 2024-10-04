
view: f_alunos_end {
  derived_table: {
    sql: select
        codturma,
        count(distinct cgmaluno) as alunos
      from mpv-looker-rede-municipal.Datalake.dMatriculas
      group by 1 ;;
    datagroup_trigger: rede_datagroup_end
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

  dimension: alunos {
    type: number
    sql: ${TABLE}.alunos ;;
  }

  measure: total_alunos {
    type: sum
    sql: ${TABLE}.alunos ;;
  }

  set: detail {
    fields: [
        codturma,
  alunos
    ]
  }
}

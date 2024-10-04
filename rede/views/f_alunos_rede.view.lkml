
view: f_alunos_rede {
  derived_table: {
    sql:
        select
          codturma,
          count(distinct cgmaluno) as alunos
        from mpv-looker-rede-municipal.Datalake.dMatriculas
        group by 1;;
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
    type: number
    sql: sum(${TABLE}.alunos) ;;
  }

  set: detail {
    fields: [
        codturma,
  alunos
    ]
  }
}

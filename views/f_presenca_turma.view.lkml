
view: f_presenca_turma {
  derived_table: {
    sql: select
        CodTurma,
        SemanaAno,
        case
          when TotalAulas = 0 then 0
          else round((TotalPresenca) / TotalAulas * 100,2)
        end as med
      from
      (
        select
          CodTurma,
          SemanaAno,
          sum(TotalPresenca) as TotalPresenca,
          sum(TotalAulas) as TotalAulas
        from mpv-looker-rede-municipal.Datalake.fPresenca_Turma
        group by 1,2
      ) ;;
  datagroup_trigger: mvp_looker_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cod_turma {
    primary_key: yes
    type: number
    sql: ${TABLE}.CodTurma ;;
  }

  dimension: semana_ano {
    type: number
    sql: ${TABLE}.SemanaAno ;;
  }

  dimension: med {
    type: number
    sql: ${TABLE}.med ;;
  }

  set: detail {
    fields: [
        cod_turma,
  semana_ano,
  med
    ]
  }
}

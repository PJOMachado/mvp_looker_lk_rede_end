view: f_presenca_turma {
  derived_table: {
    sql: with presenca as
      (
      select
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
            )
      )
      select
      *
      from
      (
      select
        a.*,
        b.SEMANA_LETIVA,
        row_number() over(partition by concat(a.CodTurma,a.SemanaAno,b.SEMANA_LETIVA)) as key
      from presenca as a
      left join mpv-looker-rede-municipal.Datalake.dCalendario as b
      on a.SemanaAno = b.SEMANA_DO_ANO
      )
      where key = 1 ;;
    datagroup_trigger: mvp_looker_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cod_turma {
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

  dimension: semana_letiva {
    type: string
    sql: ${TABLE}.SEMANA_LETIVA ;;
  }

  dimension: key {
    type: number
    sql: ${TABLE}.key ;;
  }

  measure: presenca_turma {
    type: number
    value_format_name: percent_2
    sql: avg(${TABLE}.med) / 100;;
  }

  set: detail {
    fields: [
      cod_turma,
      semana_ano,
      med,
      semana_letiva,
      key
    ]
  }
}

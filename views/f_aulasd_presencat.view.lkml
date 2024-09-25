
view: f_aulasd_presencat {
  derived_table: {
    sql: select
        CodTurma,
        SemanaAno,
        Med,
        TAulasDadas,
        SEMANA_LETIVA
      from
      (
        select
          f1.*,
          f2.TAulasDadas,
          dc.SEMANA_LETIVA,
          row_number() over(partition by concat(f1.CodTurma,f1.SemanaAno,f1.Med)) as key
        from mpv-looker-rede-municipal.Datalake.fPresenca_Turma as f1
        left join mpv-looker-rede-municipal.Datalake.fAulasDadas as f2
          on f1.CodTurma = f2.codturma and f1.SemanaAno = f2.SemanaAno
        left join mpv-looker-rede-municipal.Datalake.dCalendario as dc
          on f1.SemanaAno = dc.SEMANA_DO_ANO
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
    sql: ${TABLE}.Med ;;
  }

  dimension: taulas_dadas {
    type: number
    sql: ${TABLE}.TAulasDadas ;;
  }

  dimension: semana_letiva {
    type: string
    sql: ${TABLE}.SEMANA_LETIVA ;;
  }

  measure: aulas_dadas {
    type: sum
    sql:  ${TABLE}.TAulasDadas ;;
  }

  measure: presenca_turma {
    type: number
    sql: avg(med) / 100 ;;
    value_format_name: percent_2
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.CodTurma,${TABLE}.SemanaAno,${TABLE}.Med) ;;
  }

  set: detail {
    fields: [
        cod_turma,
  semana_ano,
  med,
  taulas_dadas,
  semana_letiva
    ]
  }
}

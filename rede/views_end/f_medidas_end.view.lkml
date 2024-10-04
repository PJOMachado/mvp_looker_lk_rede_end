
view: f_medidas_end {
  derived_table: {
    sql: select
        codturma,
        SemanaAno as semanaano,
        sum(TAulasDadas) as aulas,
        0 as amparo,
        0 as med,
        '' as chave
      from mpv-looker-rede-municipal.Datalake.fAulasDadas
      group by 1,2
      union all
      select
        a.codturma,
        d.SEMANA_DO_ANO as semanaano,
        0 as aulas,
        a.Amparo_Legal_QTD as amparo,
        0 as med,
        '' as chave
      from mpv-looker-rede-municipal.Datalake.fAmparoLegal as a
      left join mpv-looker-rede-municipal.Datalake.dCalendario as d
        on cast(a.datafim as date) = d.DATA
      union all
      select
        CodTurma as codturma,
        SemanaAno as semanaano,
        0 as aulas,
        0 as amparo,
        Med as med,
        'md' as chave
      from mpv-looker-rede-municipal.Datalake.fPresenca_Turma ;;
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

  dimension: amparo {
    type: number
    sql: ${TABLE}.amparo ;;
  }

  dimension: med {
    type: number
    sql: ${TABLE}.med ;;
  }

  dimension: chave {
    type: string
    sql: ${TABLE}.chave ;;
  }
  measure: total_aulas {
    type: sum
    sql: ${TABLE}.aulas ;;
  }
  measure: total_amparo {
    type: sum
    sql: ${TABLE}.amparo ;;
  }
  measure: presenca {
    type: number
    sql: avg(case when ${TABLE}.chave <> '' and ${TABLE}.med = 0 then 0 when chave <> '' and ${TABLE}.med > 0 then ${TABLE}.med end) / 100 ;;
    value_format_name: percent_1
  }

  set: detail {
    fields: [
        codturma,
  semanaano,
  aulas,
  amparo,
  med,
  chave
    ]
  }
}


view: f_aulasd_presencat {
  derived_table: {
    sql: select
        fp.*,
        fa.TAulasDadas,
        row_number() over() as key
      from mpv-looker-rede-municipal.Datalake.fPresenca_Turma as fp
      left join mpv-looker-rede-municipal.Datalake.fAulasDadas as fa
        on fp.CodTurma = fa.codturma
        and fp.SemanaAno = fa.SemanaAno ;;
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

  dimension: key {
    primary_key: yes
    type: number
    sql: ${TABLE}.key ;;
  }

  measure: presenca {
    type: number
    value_format_name: percent_2
    sql: avg(${TABLE}.Med) / 100 ;;
  }

  set: detail {
    fields: [
        cod_turma,
  semana_ano,
  med,
  taulas_dadas,
  key
    ]
  }
}

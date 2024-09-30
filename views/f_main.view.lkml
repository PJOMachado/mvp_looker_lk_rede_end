
view: f_main {
  derived_table: {
    sql: select
        a.Codturma,
        a.SemanaAno,
        a.Med,
        b.TAulasDadas,
        sum(c.Amparo_Legal_QTD) as amparo
      from mpv-looker-rede-municipal.Datalake.fPresenca_Turma as a
      left join mpv-looker-rede-municipal.Datalake.fAulasDadas as b on a.CodTurma = b.codturma and a.SemanaAno = b.SemanaAno
      left join mpv-looker-rede-municipal.Datalake.fAmparoLegal as c on a.CodTurma = c.codturma and a.SemanaAno = extract(week from cast(c.datafim as date))
      group by 1,2,3,4 ;;
      datagroup_trigger: mvp_looker_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: codturma {
    type: number
    sql: ${TABLE}.Codturma ;;
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

  dimension: amparo {
    type: number
    sql: ${TABLE}.amparo ;;
  }
  dimension: key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.Codturma,${TABLE}.SemanaAno) ;;
  }
  measure: presenca {
    type: number
    value_format_name: percent_2
    sql: case
          when avg(${TABLE}.Med) = 0 then 0
          else avg(${TABLE}.Med) / 100
          end ;;
  }

  set: detail {
    fields: [
        codturma,
  semana_ano,
  med,
  taulas_dadas,
  amparo
    ]
  }
}

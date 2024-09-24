
view: f_aulas_dadas {
  derived_table: {
    sql: select
  codturma,
  SemanaAno,
  TAulasDadas,
  SEMANA_LETIVA
  from
  (
select
        a.*,
        b.SEMANA_LETIVA,
        row_number() over(partition by concat(a.codturma,a.SemanaAno,b.SEMANA_LETIVA)) as key
      from mpv-looker-rede-municipal.Datalake.fAulasDadas as a
      left join mpv-looker-rede-municipal.Datalake.dCalendario as b on a.SemanaAno = b.SEMANA_DO_ANO -- 10.399.704
)
where key = 1 ;;
    datagroup_trigger: mvp_looker_datagroup
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
    sql: ${TABLE}.SemanaAno ;;
  }

  dimension: taulas_dadas {
    type: number
    sql: ${TABLE}.TAulasDadas ;;
  }

  dimension: semana_letiva {
    type: string
    sql: ${TABLE}.SEMANA_LETIVA ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.codturma,${TABLE}.SemanaAno) ;;
  }

  measure: aulas_dadas {
    type: sum
    sql: ${TABLE}.TAulasDadas ;;
  }

  set: detail {
    fields: [
      codturma,
      semana_ano,
      taulas_dadas,
      semana_letiva
    ]
  }
}

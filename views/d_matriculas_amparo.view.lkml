
view: d_matriculas_amparo {
  derived_table: {
    sql: with amparo_legal as
      (
        select
          cgmkey as amparo_legal,
          datafim
        from
        (
          select
            cgmkey,
            datafim,
            row_number() over(partition by cgmkey order by cast(datafim as date) desc) as key
          from mpv-looker-rede-municipal.Datalake.fAmparoLegal
        )
        where key = 1
      )
      select
        dm.*,
        am.*
      from mpv-looker-rede-municipal.Datalake.dMatriculas as dm
      left join amparo_legal as am
        on dm.cgmkey = am.amparo_legal ;;
        datagroup_trigger: mvp_looker_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cgmkey {
    type: string
    sql: ${TABLE}.cgmkey ;;
  }

  dimension: cgmaluno {
    type: number
    sql: ${TABLE}.cgmaluno ;;
  }

  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }

  dimension: nome_aluno {
    type: string
    label: "Nome Aluno"
    sql: ${TABLE}.`Nome Aluno` ;;
  }

  dimension: descrsituacaomatricula {
    type: string
    sql: ${TABLE}.descrsituacaomatricula ;;
  }

  dimension: turma {
    type: string
    sql: ${TABLE}.Turma ;;
  }

  dimension: med_geral {
    type: number
    sql: ${TABLE}.MedGeral ;;
  }

  dimension: amparo_legal {
    type: string
    sql: ${TABLE}.amparo_legal ;;
  }

  dimension: datafim {
    type: string
    sql: ${TABLE}.datafim ;;
  }

  set: detail {
    fields: [
        cgmkey,
  cgmaluno,
  codturma,
  nome_aluno,
  descrsituacaomatricula,
  turma,
  med_geral,
  amparo_legal,
  datafim
    ]
  }
}

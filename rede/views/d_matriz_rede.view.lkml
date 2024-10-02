
view: d_matriz_rede {
  derived_table: {
    sql: select
      distinct
        dm.codmatriz,
        dm.descrabrevcomposicao,
        dd.nomedisciplina,
      from mpv-looker-rede-municipal.Datalake.dMatrizcurricular as dm
      left join mpv-looker-rede-municipal.Datalake.dDisciplina as dd
        on dm.coddisciplina = dd.coddisciplina ;;
    datagroup_trigger: rede_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: codmatriz {
    type: string
    sql: ${TABLE}.codmatriz ;;
  }

  dimension: descrabrevcomposicao {
    type: string
    sql: ${TABLE}.descrabrevcomposicao ;;
  }

  dimension: nomedisciplina {
    type: string
    sql: ${TABLE}.nomedisciplina ;;
  }

  set: detail {
    fields: [
        codmatriz,
  descrabrevcomposicao,
  nomedisciplina
    ]
  }
}


view: d_turmas {
  derived_table: {
    sql: select
        *
      from
      (
        select
          *,
          row_number() over(partition by codturma order by nomecursodet desc) as key
        from mpv-looker-rede-municipal.Datalake.dTurmas
      )
      where key = 1 ;;
      datagroup_trigger: mvp_looker_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: codmatriz {
    type: string
    sql: ${TABLE}.codmatriz ;;
  }

  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }

  dimension: codmec {
    type: number
    sql: ${TABLE}.codmec ;;
  }

  dimension: descrzona {
    type: string
    sql: ${TABLE}.descrzona ;;
  }

  dimension: nomecursodet {
    type: string
    sql: ${TABLE}.nomecursodet ;;
  }

  dimension: codmunicipioibge {
    type: number
    sql: ${TABLE}.codmunicipioibge ;;
  }

  dimension: nomemunicipio40 {
    type: string
    sql: ${TABLE}.nomemunicipio40 ;;
  }

  dimension: codnucleoregional {
    type: number
    sql: ${TABLE}.codnucleoregional ;;
  }

  dimension: nomenreabrev {
    type: string
    sql: ${TABLE}.nomenreabrev ;;
  }

  dimension: escola {
    type: string
    sql: ${TABLE}.Escola ;;
  }

  dimension: turma {
    type: string
    sql: ${TABLE}.Turma ;;
  }

  dimension: descrexpediente {
    type: string
    sql: ${TABLE}.descrexpediente ;;
  }

  dimension: descrturno {
    type: string
    sql: ${TABLE}.descrturno ;;
  }

  dimension: codetapamodalidade {
    type: number
    sql: ${TABLE}.codetapamodalidade ;;
  }

  dimension: codmodalidade {
    type: number
    sql: ${TABLE}.codmodalidade ;;
  }

  dimension: descrtipoestab {
    type: string
    sql: ${TABLE}.descrtipoestab ;;
  }

  dimension: key {
    type: number
    sql: ${TABLE}.key ;;
  }

  set: detail {
    fields: [
        codmatriz,
  codturma,
  codmec,
  descrzona,
  nomecursodet,
  codmunicipioibge,
  nomemunicipio40,
  codnucleoregional,
  nomenreabrev,
  escola,
  turma,
  descrexpediente,
  descrturno,
  codetapamodalidade,
  codmodalidade,
  descrtipoestab,
  key
    ]
  }
}


view: d_rls {
  derived_table: {
    sql:
with rls as
(
  select
    email,
    codmec,
    nivel,
    row_number() over(partition by email order by nivel desc) as key
  from
  (
    select
      EmailUsuario as email,
      codmec,
      1 as nivel
    from mpv-looker-rede-municipal.Datalake.dRLS_Escola
    union all
    select
      EmailUsuario as email,
      codmec,
      2 as nivel
    from mpv-looker-rede-municipal.Datalake.dRLS_Municipal
    union all
    select
      EmailUsuario as email,
      codNucleoRegional as codmec,
      3 as nivel
    from mpv-looker-rede-municipal.Datalake.dRLS_NRE
  )
)
  select
    r.email,
    r.nivel as nivel_acesso,
    dt.*
  from rls as r
  join mpv-looker-rede-municipal.Datalake.dTurmas as dt
  on r.codmec = (
    case
      when r.nivel = 3 then dt.codnucleoregional
      else dt.codmec
    end
                )
  where r.key = 1;;
  datagroup_trigger: mvp_looker_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: nivel_acesso {
    type: number
    sql: ${TABLE}.nivel_acesso ;;
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

  dimension: descrmodalidade {
    type: string
    sql: ${TABLE}.descrmodalidade ;;
  }

  dimension: descretapamodalidade {
    type: string
    sql: ${TABLE}.descretapamodalidade ;;
  }

  dimension: coddisciplina {
    type: number
    sql: ${TABLE}.coddisciplina ;;
  }

  dimension: chsemanaldisciplina {
    type: number
    sql: ${TABLE}.chsemanaldisciplina ;;
  }

  dimension: nomecursosae30 {
    type: string
    sql: ${TABLE}.nomecursosae30 ;;
  }

  dimension: descrcomposicao {
    type: string
    sql: ${TABLE}.descrcomposicao ;;
  }

  dimension: descrabrevcomposicao {
    type: string
    sql: ${TABLE}.descrabrevcomposicao ;;
  }

  dimension: codmatrizcurricular {
    type: number
    sql: ${TABLE}.codmatrizcurricular ;;
  }

  dimension: nomedisciplina {
    type: string
    sql: ${TABLE}.nomedisciplina ;;
  }

  dimension: cgmkey {
    type: string
    sql: ${TABLE}.cgmkey ;;
  }

  dimension: cgmaluno {
    type: number
    sql: ${TABLE}.cgmaluno ;;
  }

  dimension: nomealuno {
    type: string
    sql: ${TABLE}.nomealuno ;;
  }

  dimension: descrsituacaomatricula {
    type: string
    sql: ${TABLE}.descrsituacaomatricula ;;
  }

  dimension: medgeral {
    type: number
    sql: ${TABLE}.medgeral ;;
  }

  set: detail {
    fields: [
        email,
  nivel_acesso,
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
  descrmodalidade,
  descretapamodalidade,
  coddisciplina,
  chsemanaldisciplina,
  nomecursosae30,
  descrcomposicao,
  descrabrevcomposicao,
  codmatrizcurricular,
  nomedisciplina,
  cgmkey,
  cgmaluno,
  nomealuno,
  descrsituacaomatricula,
  medgeral
    ]
  }
}


view: d_matriculas_end {
  derived_table: {
    sql: with dturmas as
      (
      select
        dt.*,
        dm.descrmodalidade,
        de.descretapamodalidade
      from mpv-looker-rede-municipal.Datalake.dTurmas as dt
      left join mpv-looker-rede-municipal.Datalake.dModalidade as dm
        on dt.codmodalidade = dm.codmodalidade
      left join mpv-looker-rede-municipal.Datalake.dEtapaModalidade as de
        on dt.codetapamodalidade = de.codetapamodalidade
      )
      select
        dm.cgmkey,
        dm.cgmaluno,
        dm.codturma,
        dm.`Nome Aluno` as nome_aluno,
        dm.descrsituacaomatricula,
        dm.Turma as turma,
        dm.MedGeral as medgeral,
        dt.codmatriz,
        dt.codmec,
        dt.descrzona,
        dt.nomecursodet,
        dt.codmunicipioibge,
        dt.nomemunicipio40,
        dt.codnucleoregional,
        dt.nomenreabrev,
        dt.Escola as escola,
        dt.descrexpediente,
        dt.descrturno,
        dt.codetapamodalidade,
        dt.codmodalidade,
        dt.descrtipoestab,
        dt.descrmodalidade,
        dt.descretapamodalidade,
        sum(fa.Amparo_Legal_QTD) as amparo
      from mpv-looker-rede-municipal.Datalake.dMatriculas as dm
      left join dturmas as dt
        on dm.codturma = dt.codturma -- 1.212.205
      full join mpv-looker-rede-municipal.Datalake.fAmparoLegal as fa
        on dm.cgmkey = fa.cgmkey
      group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
      order by dm.`Nome Aluno` asc ;;
    datagroup_trigger: rede_datagroup_end
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cgmkey {
    primary_key: yes
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
    sql: ${TABLE}.nome_aluno ;;
  }

  dimension: descrsituacaomatricula {
    type: string
    sql: ${TABLE}.descrsituacaomatricula ;;
  }

  dimension: turma {
    type: string
    sql: ${TABLE}.turma ;;
  }

  dimension: medgeral {
    type: number
    sql: ${TABLE}.medgeral ;;
  }

  dimension: codmatriz {
    type: string
    sql: ${TABLE}.codmatriz ;;
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
    sql: ${TABLE}.escola ;;
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

  dimension: amparo {
    type: number
    sql: ${TABLE}.amparo ;;
  }

  measure: med_presenca_geral {
    type: number
    value_format_name: percent_1
    sql: avg(${TABLE}.medgeral) / 100 ;;
  }

  set: detail {
    fields: [
        cgmkey,
  cgmaluno,
  codturma,
  nome_aluno,
  descrsituacaomatricula,
  turma,
  medgeral,
  codmatriz,
  codmec,
  descrzona,
  nomecursodet,
  codmunicipioibge,
  nomemunicipio40,
  codnucleoregional,
  nomenreabrev,
  escola,
  descrexpediente,
  descrturno,
  codetapamodalidade,
  codmodalidade,
  descrtipoestab,
  descrmodalidade,
  descretapamodalidade,
  amparo
    ]
  }
}

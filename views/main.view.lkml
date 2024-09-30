
view: main {
  derived_table: {
    sql:
with f_presenca_alunos as
(
  select
    fp.CodTurma,
    fp.SemanaAno,
    concat(fp.Cgm,"-",fp.NumMatricula) as CgmKey,
    sum(fp.TotalPresenca) as TotalPresenca,
    sum(fp.TotalFaltas) as TotalFaltas,
    sum(fp.TotalAulas) as TotalAulas,
    count(distinct fa.cgmkey) as amparo
  from mpv-looker-rede-municipal.Datalake.fPresencaAlunos as fp
  left join
  (
    select
      codturma,
      cgmkey,
      extract(week from cast(datafim as date)) as semanaano
    from mpv-looker-rede-municipal.Datalake.fAmparoLegal
  ) as fa
    on concat(fp.Cgm,"-",fp.NumMatricula) = fa.cgmkey and fp.SemanaAno = fa.semanaano and fp.CodTurma = fa.codturma
  group by 1,2,3 -- 32.290.773
),
d_turmas as
(
  select
    *
  from
  (
    select
      *,
      row_number() over(partition by codturma order by nomecursodet desc) as key
    from mpv-looker-rede-municipal.Datalake.dTurmas
  )
  where key = 1
)
select
  d.codmatriz,
  d.codturma,
  d.codmec,
  d.descrzona,
  d.nomecursodet,
  d.codmunicipioibge,
  d.nomemunicipio40,
  d.codnucleoregional,
  d.nomenreabrev,
  d.Escola,
  d.Turma,
  d.descrexpediente,
  d.descrturno,
  d.codetapamodalidade,
  d.codmodalidade,
  d.descrtipoestab,
  f.SemanaAno,
  f.CgmKey,
  f.TotalPresenca,
  f.TotalFaltas,
  f.TotalAulas,
  f.amparo,
  dm.cgmaluno,
  dm.`Nome Aluno` as nomealuno,
  dm.descrsituacaomatricula,
  dm.turma as turma_matricula,
  dm.MedGeral,
  dc.SEMANA_LETIVA
from f_presenca_alunos as f
left join d_turmas as d on f.CodTurma = d.codturma
left join mpv-looker-rede-municipal.Datalake.dMatriculas as dm on f.CgmKey = dm.cgmkey
left join
(
  select
    distinct
    SEMANA_DO_ANO,
    SEMANA_LETIVA
  from mpv-looker-rede-municipal.Datalake.dCalendario
) as dc on f.SemanaAno = dc.SEMANA_DO_ANO ;;
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

  dimension: semana_ano {
    type: number
    sql: ${TABLE}.SemanaAno ;;
  }

  dimension: cgm_key {
    type: string
    sql: ${TABLE}.CgmKey ;;
  }

  dimension: total_presenca {
    type: number
    sql: ${TABLE}.TotalPresenca ;;
  }

  dimension: total_faltas {
    type: number
    sql: ${TABLE}.TotalFaltas ;;
  }

  dimension: total_aulas {
    type: number
    sql: ${TABLE}.TotalAulas ;;
  }

  dimension: amparo {
    type: number
    sql: ${TABLE}.amparo ;;
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

  dimension: turma_matricula {
    type: string
    sql: ${TABLE}.turma_matricula ;;
  }

  dimension: med_geral {
    type: number
    sql: ${TABLE}.MedGeral ;;
  }
  dimension: semana_letiva {
    type: string
    sql: ${TABLE}.SEMANA_LETIVA ;;
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
  semana_ano,
  cgm_key,
  total_presenca,
  total_faltas,
  total_aulas,
  amparo,
  cgmaluno,
  nomealuno,
  descrsituacaomatricula,
  turma_matricula,
  med_geral,
  semana_letiva
    ]
  }
}

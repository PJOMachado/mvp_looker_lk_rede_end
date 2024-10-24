
view: d_turmas_end {
  derived_table: {
    sql: select
        dt.*,
        dm.descrmodalidade,
        de.descretapamodalidade,
        al.alunos,
        row_number() over(partition by dt.codturma) as key
      from mpv-looker-rede-municipal.Datalake.dTurmas as dt
      left join mpv-looker-rede-municipal.Datalake.dModalidade as dm
        on dt.codmodalidade = dm.codmodalidade
      left join mpv-looker-rede-municipal.Datalake.dEtapaModalidade as de
        on dt.codetapamodalidade = de.codetapamodalidade
      full join
      (
        select
        codturma,
        count(cgmaluno) as alunos
        from
        (
        select
          codturma,
          row_number() over(partition by cgmaluno) as key,
          cgmaluno
        from mpv-looker-rede-municipal.Datalake.dMatriculas
        )
        where key = 1
        group by 1 -- 75.227
      ) as al
        on dt.codturma = al.codturma ;;
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
    #primary_key: yes
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

  dimension: alunos {
    type: number
    sql: ${TABLE}.alunos ;;
  }

  measure: total_alunos {
    type: sum_distinct #number
    sql_distinct_key: ${TABLE}.codturma ;;
    sql: ${TABLE}.alunos --(select sum(far.alunos) from ${TABLE} as far)
    ;;
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
  descrmodalidade,
  descretapamodalidade,
  alunos,
  key
    ]
  }
}
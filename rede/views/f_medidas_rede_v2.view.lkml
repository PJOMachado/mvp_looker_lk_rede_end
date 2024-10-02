
view: f_medidas_rede_v2 {
  derived_table: {
    sql: with calendario as
      (
        select
          distinct
          SEMANA_DO_ANO,
          SEMANA_LETIVA
        from mpv-looker-rede-municipal.Datalake.dCalendario
      ),
      amparo as
      (
      select
      codturma,
      semana_do_ano,
      sum(amparo) as amparo
      from
      (
        select
          a.codturma,
          a.datafim,
          a.Amparo_Legal_QTD as amparo,
          d.SEMANA_DO_ANO as semana_do_ano
        from mpv-looker-rede-municipal.Datalake.fAmparoLegal as a -- 1.536.159 1.536.159
        left join mpv-looker-rede-municipal.Datalake.dCalendario as d
          on cast(a.datafim as date) = d.DATA
        )
        group by 1,2
      ),
      alunos as
      (
        select
          codturma,
          count(distinct cgmaluno) as alunos
        from mpv-looker-rede-municipal.Datalake.dMatriculas
        group by 1
      ),
      fato as
      (
        select
          case
            when fp.CodTurma is null then fa.codturma
            else fp.CodTurma
          end as codturma,
          case
            when fp.SemanaAno is null then fa.semanaano
            else fp.SemanaAno
          end as semanaano,
          fp.Med as med,
          fa.TAulasDadas as aulasdadas
        from mpv-looker-rede-municipal.Datalake.fPresenca_Turma as fp
        full join mpv-looker-rede-municipal.Datalake.fAulasDadas as fa
          on fp.CodTurma = fa.codturma
          and fp.SemanaAno = fa.semanaano
      )
      select
        ft.*,
        al.alunos,
        am.amparo,
        dc.SEMANA_LETIVA as semana_letiva,
        row_number() over(partition by al.codturma,al.alunos) as dedu_alunos
      from fato as ft
      left join alunos as al on ft.codturma = al.codturma
      left join calendario as dc on ft.semanaano = dc.SEMANA_DO_ANO
      full outer join amparo as am on ft.codturma = am.codturma and ft.semanaano = am.semana_do_ano ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }

  dimension: semanaano {
    type: number
    sql: ${TABLE}.semanaano ;;
  }

  dimension: med {
    type: number
    sql: ${TABLE}.med ;;
  }

  dimension: aulasdadas {
    type: number
    sql: ${TABLE}.aulasdadas ;;
  }

  dimension: alunos {
    type: number
    sql: ${TABLE}.alunos ;;
  }

  dimension: amparo {
    type: number
    sql: ${TABLE}.amparo ;;
  }

  dimension: semana_letiva {
    type: string
    sql: ${TABLE}.semana_letiva ;;
  }

  dimension: dedu_alunos {
    type: number
    sql: ${TABLE}.dedu_alunos ;;
  }
  measure: presenca {
    type: number
    value_format_name: percent_1
    sql: case
            when avg(${TABLE}.med) = 0 then 0
            else avg(${TABLE}.med) / 100
         end;;
  }
  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.coturma,${TABLE}.semanaano,${TABLE}.med,${TABLE}.aulasdadas) ;;
  }

  set: detail {
    fields: [
        codturma,
  semanaano,
  med,
  aulasdadas,
  alunos,
  amparo,
  semana_letiva,
  dedu_alunos
    ]
  }
}

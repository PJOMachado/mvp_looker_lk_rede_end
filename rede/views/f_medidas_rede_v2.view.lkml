
view: f_medidas_rede_v2 {
  derived_table: {
    sql:
with amparo as
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
    am.amparo
  from fato as ft
  full outer join amparo as am on ft.codturma = am.codturma and ft.semanaano = am.semana_do_ano
  --where semana_letiva = {% parameter semana_letiva_param %}
  ;;
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

  dimension: amparo {
    type: number
    sql: ${TABLE}.amparo ;;
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
    sql: concat(${TABLE}.codturma,${TABLE}.semanaano,${TABLE}.med) ;;
  }

  parameter: semana_letiva_param {
    #default_value: "% <> null %"
    type: string
    allowed_value: {
      label: "01 - 05/02 - 11/02"
      value: "01 - 05/02 - 11/02"
    }
    allowed_value: {
      label: "02 - 12/02 - 18/02"
      value: "02 - 12/02 - 18/02"
    }
  }

  set: detail {
    fields: [
        codturma,
  semanaano,
  med,
  aulasdadas,
  amparo
    ]
  }
}

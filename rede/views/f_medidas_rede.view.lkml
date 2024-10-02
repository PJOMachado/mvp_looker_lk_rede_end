
view: f_medidas_rede {
  derived_table: {
    sql: with amparo as
      (
        select
          codturma,
          extract(week from cast(datafim as date)) as semanaano,
          sum(Amparo_Legal_QTD) as amparo
        from mpv-looker-rede-municipal.Datalake.fAmparoLegal
        group by 1,2
      ),
      alunos as
      (
        select
          codturma,
          count(distinct cgmaluno) as alunos
         from mpv-looker-rede-municipal.Datalake.dMatriculas
         group by 1
      )
      select
        case
          when fp.CodTurma is null then fa.codturma
          else fp.CodTurma
        end as coturma,
        case
          when fp.SemanaAno is null then fa.semanaano
          else fp.SemanaAno
        end as semanaano,
        fp.Med as med,
        fa.TAulasDadas as aulasdadas,
        am.amparo,
        al.alunos,
        row_number() over(partition by concat(al.codturma,al.alunos)) as key_alunos
      from mpv-looker-rede-municipal.Datalake.fPresenca_Turma as fp
      full join mpv-looker-rede-municipal.Datalake.fAulasDadas as fa
        on fp.CodTurma = fa.codturma
        and fp.SemanaAno = fa.semanaano
      left join amparo as am
        on fp.CodTurma = am.codturma
        and fp.SemanaAno = am.semanaano
      left join alunos as al on fp.CodTurma = al.codturma ;;
    datagroup_trigger: rede_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: coturma {
    type: number
    sql: ${TABLE}.coturma ;;
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

  dimension: alunos {
    type: number
    sql: ${TABLE}.alunos ;;
  }

  dimension: key_alunos {
    type: number
    sql: ${TABLE}.key_alunos ;;
  }
  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${TABLE}.coturma,${TABLE}.semanaano) ;;
  }
  measure: presenca {
    type: number
    value_format_name: percent_1
    sql: case
            when avg(${TABLE}.med) = 0 then 0
            else avg(${TABLE}.med) / 100
         end;;
  }
  measure: aulas_dadas {
    type: sum
    sql: ${TABLE}.aulasdadas ;;
  }
  measure: s_amparo {
    type: sum
    sql: ${TABLE}.amparo  ;;
  }
  measure: s_alunos {
    type: number
    sql: (select sum(${TABLE}.alunos) from ${TABLE} where ${TABLE}.key_alunos = 1) ;;
  }

  set: detail {
    fields: [
        coturma,
  semanaano,
  med,
  aulasdadas,
  amparo,
  alunos,
  key_alunos
    ]
  }
}

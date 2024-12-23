
view: f_presenca_alunos_turma {
  derived_table: {
    sql: with cte as
      (
      select
        concat(Cgm,'-',NumMatricula) as cgmkey,
        CodTurma as codturma,
        SemanaAno as semanaano,
        sum(TotalPresenca) as totalpresenca,
        sum(TotalFaltas) as totalfaltas,
        sum(TotalAulas) as totalaulas
      from mpv-looker-rede-municipal.Datalake.fPresencaAlunos
      group by 1,2,3
      ),
      atual as
      (
      select
        *
      from
      (
        select
        cgmkey,
        codturma,
        semanaano,
        case
          when totalpresenca = 0 or totalaulas = 0 then 0
          else totalpresenca / totalaulas * 100
        end as medpresenca_atual,
        row_number() over(partition by cgmkey order by semanaano desc) as key
        from cte
      )
      where key = 1
      ),
      anterior as
      (
        select
          *
        from
        (
          select
          cgmkey,
          codturma,
          semanaano,
          case
            when totalpresenca = 0 or totalaulas = 0 then 0
            else totalpresenca / totalaulas * 100
          end as medpresenca_anterior,
          row_number() over(partition by cgmkey order by semanaano desc) as key
          from cte
          order by semanaano desc
        )
      where key = 2
      )
      select
        att.cgmkey,
        att.codturma,
        att.medpresenca_atual,
        an.medpresenca_anterior
      from atual as att left join anterior as an on att.cgmkey = an.cgmkey ;;
    datagroup_trigger: rede_datagroup_end
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cgmkey {
    type: string
    sql: ${TABLE}.cgmkey ;;
  }

  dimension: codturma {
    type: number
    sql: ${TABLE}.codturma ;;
  }

  dimension: medpresenca_atual {
    type: number
    sql: ${TABLE}.medpresenca_atual ;;
  }

  measure: med_atual {
    type: number
    value_format_name: percent_1
    sql: case when avg(${TABLE}.medpresenca_atual) = 0 then 0
    else avg(${TABLE}.medpresenca_atual) / 100
    end ;;
  }

  dimension: medpresenca_anterior {
    type: number
    sql: ${TABLE}.medpresenca_anterior ;;
  }

  measure: med_anterior {
    type: number
    value_format_name: percent_1
    sql: case when avg(${TABLE}.medpresenca_anterior) = 0 then 0
          else avg(${TABLE}.medpresenca_anterior) / 100
          end ;;
  }


  set: detail {
    fields: [
        cgmkey,
  codturma,
  medpresenca_atual,
  medpresenca_anterior
    ]
  }
}

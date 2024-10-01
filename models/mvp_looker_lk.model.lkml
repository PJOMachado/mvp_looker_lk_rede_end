connection: "mvp_looker"


include: "/views/**/*.view.lkml"

datagroup: mvp_looker_datagroup {
  sql_trigger:
  SELECT
    CASE
      WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR)) BETWEEN 2 AND 6
      AND EXTRACT(HOUR FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR)) = 5
      THEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR))
      ELSE NULL
    END AS day_of_week ;;
  max_cache_age: "10 hour"
}








explore: d_turmas {
  persist_with: mvp_looker_datagroup
  label: "Rede"
  join: rls {
    type: left_outer
    sql_on:
      case
        when ${rls.nivel} = 3 then ${rls.codmec} = ${d_turmas.codnucleoregional}
        else ${rls.codmec} = ${d_turmas.codmec}
      end ;;
    relationship: one_to_many
    }
  join: f_main {
    type: inner
    sql_on: ${d_turmas.codturma} = ${f_main.codturma}  ;;
    relationship: many_to_one
  }
  join: d_calendario {
    type: inner
    sql_on: ${f_main.semana_ano} = ${d_calendario.semana_do_ano} ;;
    relationship: many_to_many
  }
  join: d_matriculas {
    type: left_outer
    sql_on: ${d_matriculas.codturma} = ${d_turmas.codturma} ;;
    relationship: many_to_one
  }
    join: d_modalidade {
      type: left_outer
      sql_on: ${d_turmas.codmodalidade} = ${d_modalidade.codmodalidade} ;;
      relationship: many_to_one
    }
    join: d_etapa_modalidade {
      type: left_outer
      sql_on: ${d_turmas.codetapamodalidade} = ${d_etapa_modalidade.codetapamodalidade} ;;
      relationship: many_to_one
    }
    join: d_matrizcurricular {
      type: left_outer
      sql_on: ${d_matrizcurricular.codmatriz} = ${d_turmas.codmatriz} ;;
      relationship: one_to_many
    }
    join: d_disciplina {
      type: left_outer
      sql_on: ${d_matrizcurricular.coddisciplina} = ${d_disciplina.coddisciplina} ;;
      relationship: many_to_one
    }
}


explore: f_main {
  persist_with: mvp_looker_datagroup
  label: "Teste"
  join: d_calendario {
    type: inner
    sql_on: ${f_main.semana_ano} = ${d_calendario.semana_do_ano} ;;
    relationship: many_to_many
  }
}

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

explore: f_aulasd_presencat {
  persist_with: mvp_looker_datagroup
  label: "Main"
  join: d_turmas {
    type: inner
    sql_on: ${f_aulasd_presencat.cod_turma} = ${d_turmas.codturma};;
    relationship: one_to_many
  }
  join: rls {
    type: left_outer
    sql_on:
      ${rls.nivel} = 3 and ${rls.codmec} = ${d_turmas.codnucleoregional}
      or ${rls.nivel} != 3 and ${rls.codmec} = ${d_turmas.codmec};;
    relationship: one_to_many
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
    relationship: many_to_one
  }
  join: d_disciplina {
    type: left_outer
    sql_on: ${d_matrizcurricular.coddisciplina} = ${d_disciplina.coddisciplina} ;;
    relationship: many_to_one
  }
  join: d_matriculas_amparo {
    type: left_outer
    sql_on: ${d_matriculas_amparo.codturma} = ${d_turmas.codturma} ;;
    relationship: many_to_one
  }
  join: d_calendario {
    type: left_outer
    sql_on: ${f_aulasd_presencat.semana_ano} = ${d_calendario.semana_do_ano} ;;
    relationship: many_to_many
  }












}

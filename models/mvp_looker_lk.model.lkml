connection: "mvp_looker"


include: "/views/**/*.view.lkml"

datagroup: mvp_looker_datagroup {
  sql_trigger:
  SELECT
    CASE
      WHEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR)) BETWEEN 2 AND 6
      AND EXTRACT(HOUR FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR)) = 8
      THEN EXTRACT(DAYOFWEEK FROM TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR))
      ELSE NULL
    END AS day_of_week ;;
  max_cache_age: "10 hour"
}

explore: d_rls {
  persist_with: mvp_looker_datagroup
  label: "Main"
  join: d_modalidade {
    type: left_outer
    sql_on: ${d_rls.codmodalidade} = ${d_modalidade.codmodalidade} ;;
    relationship: many_to_one
  }
  join: d_etapa_modalidade {
    type: left_outer
    sql_on: ${d_rls.codetapamodalidade} = ${d_etapa_modalidade.codetapamodalidade} ;;
    relationship: many_to_one
  }
  join: d_matrizcurricular {
    type: left_outer
    sql_on: ${d_matrizcurricular.codmatriz} = ${d_rls.codmatriz};;
    relationship: many_to_one
  }
  join: d_disciplina {
    type: left_outer
    sql_on: ${d_matrizcurricular.coddisciplina} = ${d_disciplina.coddisciplina} ;;
    relationship: many_to_one
  }
  join: f_aulas_dadas {
    type: left_outer
    sql_on: ${f_aulas_dadas.codturma} = ${d_rls.codturma} ;;
    relationship: many_to_one
  }
  join: f_presenca_turma {
    type: left_outer
    sql_on: ${f_presenca_turma.cod_turma} = ${d_rls.codturma} ;;
    relationship: many_to_one
  }
  join: d_matriculas {
    type: left_outer
    sql_on: ${d_matriculas.codturma} = ${d_rls.codturma}  ;;
    relationship: many_to_one
  }
  join: f_amparo_legal {
    type: left_outer
    sql_on: ${f_amparo_legal.cgmkey} = ${d_matriculas.cgmkey} ;;
    relationship: many_to_many
  }
  join: f_presenca_alunos {
    type: left_outer
    sql_on: ${f_presenca_alunos.cgmkey} = ${d_matriculas.cgmkey} ;;
    relationship: many_to_many
  }
  join: d_calendario {
    type: left_outer
    sql_on: ${f_presenca_turma.semana_ano} = ${d_calendario.semana_do_ano} ;;
    relationship: many_to_many
  }
}

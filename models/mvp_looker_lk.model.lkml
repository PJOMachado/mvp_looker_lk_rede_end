connection: "mvp_looker"


include: "/views/**/*.view.lkml"

datagroup: mvp_looker_datagroup {
  sql_trigger: SELECT (EXTRACT(DAY_OF_WEEK FROM NOW())) WHERE DAY_OF_WEEK(NOW()) IN (1,2,3,4,5) AND HOUR(NOW()) - 3 IN(8) ;; #Recriara a PDT nos horários definidos.
  max_cache_age: "10 hour"
}

persist_with: mvp_looker_datagroup

explore: main {
  join:  d_modalidade{
    type: left_outer
    sql_on: ${main.codmodalidade} = ${d_modalidade.codmodalidade} ;;
    relationship: many_to_one
  }
  join: d_etapa_modalidade {
    type: left_outer
    sql_on: ${main.codetapamodalidade} = ${d_etapa_modalidade.codetapamodalidade} ;;
    relationship: many_to_one
  }
  #join: d_aulas_prev { -- Não temos essa tabela no Datalake
  #  type: inner
  #  slq_on: ${main.codturma} = ${d_aulas_prev.codturma} ;;
  #  relationship: one_to_one
  #}
  join: d_matrizcurricular {
    type: left_outer
    sql_on: ${main.codmatriz} = ${d_matrizcurricular.codmatriz} ;;
    relationship: one_to_many
  }
  join: d_disciplina {
    type: left_outer
    sql_on: ${d_matrizcurricular.coddisciplina} = ${d_disciplina.coddisciplina} ;;
    relationship: many_to_one
  }
  join: f_aulas_dadas {
    type: left_outer
    sql_on: ${main.codturma} = ${f_aulas_dadas.codturma} ;;
    relationship: one_to_many
  }
  join: f_presenca_turma {
    type: left_outer
    sql_on: ${main.codturma} = ${f_presenca_turma.cod_turma} ;;
    relationship: one_to_many
  }
  join: d_matriculas {
    type: left_outer
    sql_on: ${main.codturma} = ${d_matriculas.codturma} ;;
    relationship: one_to_many
  }
  join: f_amparo_legal {
    type: full_outer
    sql_on: ${d_matriculas.cgmkey} = ${f_amparo_legal.cgmkey} ;;
    relationship: many_to_many
  }
  join: f_presenca_alunos {
    type: left_outer
    sql_on: ${d_matriculas.cgmkey} = ${f_presenca_alunos.cgmkey} ;;
    relationship: many_to_many
  }
  join: d_calendario {
    type: left_outer
    sql_on: ${f_aulas_dadas.semana_ano} = ${d_calendario.semana_do_ano} ;;
    relationship: many_to_many
  }
}

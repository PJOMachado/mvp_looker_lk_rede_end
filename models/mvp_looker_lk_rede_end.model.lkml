connection: "mvp_looker"


include: "/rede/views_end/*.view.lkml"
include: "/rede/views_end/turma/*.view.lkml"
include: "/dashboard/*.dashboard.lookml"

datagroup: rede_datagroup_end {
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

explore: f_medidas_end {
  #access_filter: {
   # field: d_rls_end.email
    #user_attribute: email
  #}
  persist_with: rede_datagroup_end
  label: "Rede main"
  join: d_turmas_end {
    type: full_outer
    sql_on: ${f_medidas_end.codturma} = ${d_turmas_end.codturma} ;;
    relationship: many_to_one
  }
  join: d_rls_end {
    type: left_outer
    sql_on:
      case
        when ${d_rls_end.nivel} = 3 then ${d_rls_end.codmec} = ${d_turmas_end.codnucleoregional}
        else ${d_rls_end.codmec} = ${d_turmas_end.codmec}
      end ;;
    relationship: many_to_one
  }
  join: d_calendario_end {
    type: left_outer
    sql_on: ${f_medidas_end.semanaano} = ${d_calendario_end.semana_ano} ;;
    relationship: many_to_one
  }
  join: d_matriz_end {
    type: left_outer
    sql_on: ${d_matriz_end.codmatriz} = ${d_turmas_end.codmatriz} ;;
    relationship: many_to_one
  }
}


explore: d_matriculas_end {
  #access_filter: {
   # field: d_rls_end.email
    #user_attribute: email
  #}
  persist_with: rede_datagroup_end
  label: "Turma main"
  join: d_rls_end {
    type: left_outer
    sql_on:
      case
        when ${d_rls_end.nivel} = 3 then ${d_rls_end.codmec} = ${d_matriculas_end.codnucleoregional}
        else ${d_rls_end.codmec} = ${d_matriculas_end.codmec}
      end ;;
    relationship: many_to_one
  }
  join: d_matriz_end {
    type: left_outer
    sql_on: ${d_matriz_end.codmatriz} = ${d_matriculas_end.codmatriz} ;;
    relationship: many_to_one
  }
  join: f_presenca_alunos_turma {
    type: left_outer
    sql_on: ${d_matriculas_end.cgmkey} = ${f_presenca_alunos_turma.cgmkey} ;;
    relationship: one_to_one
  }
}

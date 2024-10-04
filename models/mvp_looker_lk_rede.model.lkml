connection: "mvp_looker"


include: "/rede/views/*.view.lkml"


datagroup: rede_datagroup {
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

explore: f_medidas_rede {
  persist_with: rede_datagroup
  label: "Rede"
  join: d_calendario_rede {
    type: full_outer
    sql_on: ${f_medidas_rede.semanaano} = ${d_calendario_rede.semana_do_ano} ;;
    relationship: many_to_one
  }
  join: d_turmas_rede {
    type: full_outer
    sql_on: ${f_medidas_rede.coturma} = ${d_turmas_rede.codturma} ;;
    relationship: many_to_one
  }
  join: d_matriz_rede {
    type: left_outer
    sql_on: ${d_turmas_rede.codmatriz} = ${d_turmas_rede.codmatriz} ;;
    relationship: many_to_one
  }
  join: rls_rede {
    type: left_outer
    sql_on:
      case
        when ${rls_rede.nivel} = 3 then ${rls_rede.codmec} = ${d_turmas_rede.codnucleoregional}
        else ${rls_rede.codmec} = ${d_turmas_rede.codmec}
      end ;;
      relationship: many_to_one
  }
}

explore: f_medidas_rede_v2 {
  label: "Redev5"
  join: d_turmas_rede {
    type: left_outer
    sql_on: ${f_medidas_rede_v2.codturma} = ${d_turmas_rede.codturma} ;;
    relationship: many_to_one
  }
  join: rls_rede {
    type: left_outer
    sql_on:
      case
        when ${rls_rede.nivel} = 3 then ${rls_rede.codmec} = ${d_turmas_rede.codnucleoregional}
        else ${rls_rede.codmec} = ${d_turmas_rede.codmec}
      end ;;
    relationship: many_to_one
  }
  join: f_alunos_rede {
    type: left_outer
    sql_on: ${d_turmas_rede.codturma} = ${f_alunos_rede.codturma} ;;
    relationship: one_to_one
  }
  join: f_amparo_rede {
    type: left_outer
    sql_on: ${d_turmas_rede.codturma} = ${f_amparo_rede.codturma} ;;
    relationship: one_to_one
  }
  join: d_calendario_rede {
    type: left_outer
    sql_on: ${d_calendario_rede.semana_do_ano} = ${f_medidas_rede_v2.semanaano} ;;
    relationship: many_to_many
  }
}

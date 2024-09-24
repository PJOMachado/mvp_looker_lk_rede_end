view: main_et2 {
  derived_table: {
    explore_source: d_rls {
      column: nomemunicipio40 {}
      column: aulas_dadas { field: f_aulas_dadas.aulas_dadas }
    }
    datagroup_trigger: mvp_looker_datagroup
  }
  dimension: nomemunicipio40 {
    description: ""
  }
  dimension: aulas_dadas {
    description: ""
    type: number
  }
}

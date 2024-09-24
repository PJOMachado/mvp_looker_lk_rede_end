view: main {
  derived_table: {
    explore_source: d_rls {
      column: presenca_turma { field: f_presenca_turma.presenca_turma }
      column: nomemunicipio40 {}
      column: alunos { field: d_matriculas.alunos }
      column: amparo_legal { field: f_amparo_legal.amparo_legal }
    }
    datagroup_trigger: mvp_looker_datagroup
  }
  dimension: presenca_turma {
    description: ""
    value_format: "#,##0.00%"
    type: number
  }
  dimension: nomemunicipio40 {
    description: ""
  }
  dimension: alunos {
    description: ""
    type: number
  }
  dimension: amparo_legal {
    description: ""
    type: number
  }
}

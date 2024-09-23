view: teste {
  derived_table: {
    explore_source: d_rls {
      column: nomemunicipio40 {}
      column: cgmaluno { field: d_matriculas.cgmaluno }
      column: taulas_dadas { field: f_aulas_dadas.taulas_dadas }
      column: amparo_legal_qtd { field: f_amparo_legal.amparo_legal_qtd }
      column: descrmodalidade { field: d_modalidade.descrmodalidade }
      column: descretapamodalidade { field: d_etapa_modalidade.descretapamodalidade }
      column: descrtipoestab {}
      column: nomecursodet {}
      column: descrzona {}
      column: descrturno {}
      column: descrexpediente {}
      column: descrabrevcomposicao { field: d_matrizcurricular.descrabrevcomposicao }
      column: nomenreabrev {}
    }
    datagroup_trigger: mvp_looker_datagroup
  }
  dimension: nomemunicipio40 {
    description: ""
  }
  dimension: cgmaluno {
    description: ""
    type: number
  }
  dimension: taulas_dadas {
    description: ""
    type: number
  }
  dimension: amparo_legal_qtd {
    description: ""
    type: number
  }
  dimension: descrmodalidade {
    description: ""
  }
  dimension: descretapamodalidade {
    description: ""
  }
  dimension: descrtipoestab {
    description: ""
  }
  dimension: nomecursodet {
    description: ""
  }
  dimension: descrzona {
    description: ""
  }
  dimension: descrturno {
    description: ""
  }
  dimension: descrexpediente {
    description: ""
  }
  dimension: descrabrevcomposicao {
    description: ""
  }
  dimension: nomenreabrev {
    description: ""
  }
}

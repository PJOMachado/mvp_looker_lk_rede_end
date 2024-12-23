- dashboard: turma
  title: TURMA
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: hGgUKPP3ZE92KeBcu0PhrG
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="display: flex; align-items: center; justify-content: center; width: 100%; background-color: #233D4D; border-radius: 50px; padding: 20px; flex-wrap: wrap;">

         <img src="https://storage.googleapis.com/looker-imagens-seedpr/farol%20seed-textobranco.png" alt="Legenda" style="max-width: 80%; height: auto; margin-left: 10px; flex-shrink: 0;">
      </div>
    row: 2
    col: 5
    width: 19
    height: 3
  - title: TURMA
    name: TURMA
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    type: looker_grid
    fields: [d_matriculas_end.nome_aluno, d_matriculas_end.cgmkey, d_matriculas_end.turma,
      d_matriculas_end.med_presenca_geral, soma_de_amparo, d_matriculas_end.descrsituacaomatricula,
      d_matriculas_end.escola, d_matriculas_end.nomemunicipio40, f_presenca_alunos_turma.med_anterior,
      f_presenca_alunos_turma.med_atual]
    sorts: [d_matriculas_end.med_presenca_geral desc, d_matriculas_end.nome_aluno]
    limit: 1200
    column_limit: 50
    total: true
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: d_matriculas_end.amparo
      expression: ''
      label: Soma de Amparo
      measure: soma_de_amparo
      type: sum
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", d_matriculas_end.nome_aluno, d_matriculas_end.cgmkey,
      d_matriculas_end.turma, d_matriculas_end.med_presenca_geral, f_presenca_alunos_turma.med_atual,
      f_presenca_alunos_turma.med_anterior, soma_de_amparo, d_matriculas_end.descrsituacaomatricula,
      d_matriculas_end.escola, d_matriculas_end.nomemunicipio40]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      d_matriculas_end.cgmkey: CGM
      d_matriculas_end.med_presenca_geral: Média geral de presença
      soma_de_amparo: Amparo legal
      d_matriculas_end.descrsituacaomatricula: Situação matrícula
      d_matriculas_end.nomemunicipio40: Município
      f_presenca_alunos_turma.med_atual: "(%) Presença na semana atual"
      f_presenca_alunos_turma.med_anterior: "(%) Presença na semana anterior"
    series_column_widths:
      f_presenca_alunos_turma.med_atual: 1
    series_cell_visualizations:
      d_matriculas_end.med_presenca_geral:
        is_active: false
    series_text_format:
      d_matriculas_end.med_presenca_geral:
        align: center
      soma_de_amparo:
        align: center
      f_presenca_alunos_turma.med_atual:
        align: center
      f_presenca_alunos_turma.med_anterior:
        align: center
    header_font_color: "#fff5f8"
    header_background_color: "#233D4D"
    conditional_formatting: [{type: greater than, value: 0.95, background_color: "#008B3B",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [d_matriculas_end.med_presenca_geral, f_presenca_alunos_turma.med_anterior,
          f_presenca_alunos_turma.med_atual]}, {type: between, value: [0.9, 0.95],
        background_color: "#FFA600", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [d_matriculas_end.med_presenca_geral, f_presenca_alunos_turma.med_anterior,
          f_presenca_alunos_turma.med_atual]}, {type: less than, value: 0.9, background_color: "#A31621",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [d_matriculas_end.med_presenca_geral, f_presenca_alunos_turma.med_anterior,
          f_presenca_alunos_turma.med_atual]}, {type: 'null', value: !!null '', background_color: "#A31621",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [d_matriculas_end.med_presenca_geral, f_presenca_alunos_turma.med_anterior,
          f_presenca_alunos_turma.med_atual]}]
    defaults_version: 1
    listen:
      MODALIDADE: d_matriculas_end.descrmodalidade
      ETAPA: d_matriculas_end.descretapamodalidade
      TIPO ESCOLA: d_matriculas_end.descrtipoestab
      CURSO: d_matriculas_end.nomecursodet
      ZONA: d_matriculas_end.descrzona
      TURNO: d_matriculas_end.descrturno
      MATRIZ CURRICULAR: d_matriz_end.descrabrevcomposicao
      NRE: d_matriculas_end.nomenreabrev
      MUNICÍPIO: d_matriculas_end.nomemunicipio40
      ESCOLA: d_matriculas_end.escola
      TURMA: d_matriculas_end.turma
    row: 5
    col: 0
    width: 24
    height: 11
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="text-align: center; width: 100%;"> <!-- Contêiner que centraliza o conteúdo -->
          <img src="https://storage.googleapis.com/looker-imagens-seedpr/logo_presente_escola.jpg" alt="Logo SEED" style="width: 100%; max-width: 200px; height: auto; display: block; margin: 0 auto;">
      </div>
    row: 2
    col: 0
    width: 5
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"background-color: rgba(35, 61, 77, 0.1); padding: 10px;\
      \ display: flex; justify-content: center; gap: 15px; border-radius: 8px;\">\n\
      \    <a href=\"/embed/dashboards/29\" style=\"background-color: #233D4D; color:\
      \ white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-size:\
      \ 16px; transition: transform 0.2s ease, background-color 0.3s ease; margin-right:\
      \ 15px;\">REDE</a>\n\n    <a href=\"/embed/dashboards/31\" style=\"background-color:\
      \ #233D4D; color: white; padding: 10px 20px; border-radius: 5px; text-decoration:\
      \ none; font-size: 16px; transition: transform 0.2s ease, background-color 0.3s\
      \ ease; margin-right: 15px;\">MUNICIPIO ESCOLA</a>\n    <a href=\"/embed/dashboards/32?\"\
      \ style=\"background-color: #233D4D; color: white; padding: 10px 20px; border-radius:\
      \ 5px; text-decoration: none; font-size: 16px; transition: transform 0.2s ease,\
      \ background-color 0.3s ease; margin-right: 15px;\">ESCOLA TURMA</a>\n</div>\n\
      \n<script>\n  document.querySelectorAll('a').forEach(button => {\n    button.addEventListener('mousedown',\
      \ function() {\n      this.style.transform = 'scale(0.95)';\n    });\n    \n\
      \    button.addEventListener('mouseup', function() {\n      this.style.transform\
      \ = 'scale(1)';\n    });\n    \n    button.addEventListener('mouseleave', function()\
      \ {\n      this.style.transform = 'scale(1)';\n    });\n  });\n</script>\n"
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: TURMA
    title: TURMA
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [MODALIDADE, ETAPA, TIPO ESCOLA, CURSO, ZONA, TURNO, MATRIZ
        CURRICULAR, NRE, MUNICÍPIO, ESCOLA]
    field: d_matriculas_end.turma
  - name: MODALIDADE
    title: MODALIDADE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, ETAPA, TIPO ESCOLA, CURSO, ZONA, TURNO, MATRIZ CURRICULAR,
      NRE, MUNICÍPIO, ESCOLA]
    field: d_matriculas_end.descrmodalidade
  - name: ETAPA
    title: ETAPA
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, TIPO ESCOLA, CURSO, ZONA, TURNO, MATRIZ
        CURRICULAR, NRE, MUNICÍPIO, ESCOLA]
    field: d_matriculas_end.descretapamodalidade
  - name: TIPO ESCOLA
    title: TIPO ESCOLA
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, ETAPA, CURSO, ZONA, TURNO, MATRIZ CURRICULAR,
      NRE, MUNICÍPIO, ESCOLA]
    field: d_matriculas_end.descrtipoestab
  - name: CURSO
    title: CURSO
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, ETAPA, TIPO ESCOLA, ZONA, TURNO, MATRIZ
        CURRICULAR, NRE, MUNICÍPIO, ESCOLA]
    field: d_matriculas_end.nomecursodet
  - name: ZONA
    title: ZONA
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, ETAPA, TIPO ESCOLA, CURSO, TURNO, MATRIZ
        CURRICULAR, NRE, MUNICÍPIO, ESCOLA]
    field: d_matriculas_end.descrzona
  - name: TURNO
    title: TURNO
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, ETAPA, TIPO ESCOLA, CURSO, ZONA, MATRIZ
        CURRICULAR, NRE, MUNICÍPIO, ESCOLA]
    field: d_matriculas_end.descrturno
  - name: MATRIZ CURRICULAR
    title: MATRIZ CURRICULAR
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, ETAPA, TIPO ESCOLA, CURSO, ZONA, TURNO,
      NRE, MUNICÍPIO, ESCOLA]
    field: d_matriz_end.descrabrevcomposicao
  - name: NRE
    title: NRE
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, ETAPA, TIPO ESCOLA, CURSO, ZONA, TURNO,
      MATRIZ CURRICULAR, MUNICÍPIO, ESCOLA]
    field: d_matriculas_end.nomenreabrev
  - name: MUNICÍPIO
    title: MUNICÍPIO
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, ETAPA, TIPO ESCOLA, CURSO, ZONA, TURNO,
      MATRIZ CURRICULAR, NRE, ESCOLA]
    field: d_matriculas_end.nomemunicipio40
  - name: ESCOLA
    title: ESCOLA
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mvp_looker_lk_rede_end
    explore: d_matriculas_end
    listens_to_filters: [TURMA, MODALIDADE, ETAPA, TIPO ESCOLA, CURSO, ZONA, TURNO,
      MATRIZ CURRICULAR, NRE, MUNICÍPIO]
    field: d_matriculas_end.escola

- dashboard: rede
  title: REDE
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: rcSJBa1cYewAdMDnKxUebp
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
  - title: REDE MUNICIPAL
    name: REDE MUNICIPAL
    model: mvp_looker_lk_rede_end
    explore: f_medidas_end
    type: table
    fields: [d_turmas_end.nomemunicipio40, f_medidas_end.presenca, f_medidas_end.total_amparo,
      f_medidas_end.total_aulas, d_turmas_end.total_alunos]
    filters: {}
    sorts: [f_medidas_end.presenca desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "(${f_medidas_end.presenca} - 1) * - 1"
      label: Faltas
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: faltas
      _type_hint: number
    - category: table_calculation
      expression: rank(${f_medidas_end.presenca},${f_medidas_end.presenca})
      label: Rank
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: rank
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", d_turmas_end.nomemunicipio40, rank, d_turmas_end.total_alunos,
      f_medidas_end.presenca, faltas, f_medidas_end.total_aulas, f_medidas_end.total_amparo]
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 70
    series_labels:
      d_turmas_end.nomemunicipio40: Município
      f_medidas_end.presenca: "(%) Presença"
      f_medidas_end.total_amparo: Amparo legal
      f_medidas_end.total_aulas: Aulas dadas
      d_turmas_end.total_alunos: Alunos
      faltas: "(%) Faltas"
    series_column_widths:
      d_turmas_end.nomemunicipio40: 180
    series_cell_visualizations:
      f_medidas_end.presenca:
        is_active: false
    series_text_format:
      f_medidas_end.presenca:
        align: center
      f_medidas_end.total_amparo:
        align: center
      f_medidas_end.total_aulas:
        align: center
      d_turmas_end.total_alunos:
        align: center
      faltas:
        align: center
        bg_color: "#233D4D"
        fg_color: "#f0ffee"
      rank:
        align: center
    header_font_color: "#f8fff8"
    header_background_color: "#233D4D"
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: greater than, value: 0.95, background_color: "#008B3B",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [f_medidas_end.presenca]}, {type: between, value: [
          0.9, 0.95], background_color: "#FFA600", font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [f_medidas_end.presenca]},
      {type: less than, value: 0.9, background_color: "#A31621", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [f_medidas_end.presenca]}]
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ETAPA: d_turmas_end.descretapamodalidade
      TIPO DE ESCOLA: d_turmas_end.descrtipoestab
      CURSO: d_turmas_end.nomecursodet
      ZONA: d_turmas_end.descrzona
      MATRIZ CURRICULAR: d_matriz_end.descrabrevcomposicao
      NRE: d_turmas_end.nomenreabrev
      SEMANA LETIVA: d_calendario_end.semana_letiva
      MUNICIPIO: d_turmas_end.nomemunicipio40
      ESCOLA: d_turmas_end.escola
      TURNO: d_turmas_end.descrturno
    row: 5
    col: 0
    width: 24
    height: 8
  - title: 'SÉRIE HISTÓRICA: (%) PRESENÇA SEMANAL'
    name: 'SÉRIE HISTÓRICA: (%) PRESENÇA SEMANAL'
    model: mvp_looker_lk_rede_end
    explore: f_medidas_end
    type: looker_area
    fields: [f_medidas_end.presenca, d_calendario_end.semana_letiva]
    filters:
      f_medidas_end.presenca: ">0"
    sorts: [d_calendario_end.semana_letiva]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "(${f_medidas_end.presenca} - 1) * - 1"
      label: Faltas
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: faltas
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: rank(${f_medidas_end.presenca},${f_medidas_end.presenca})
      label: Rank
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: rank
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: step
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: f_medidas_end.presenca,
            id: f_medidas_end.presenca, name: "(%) Presença"}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 9,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: false
    series_colors:
      f_medidas_end.presenca: "#233D4D"
      faltas: "#233D4D"
    series_labels:
      d_turmas_end.nomemunicipio40: Município
      f_medidas_end.presenca: "(%) Presença"
      f_medidas_end.total_amparo: Amparo legal
      f_medidas_end.total_aulas: Aulas dadas
      d_turmas_end.total_alunos: Alunos
      faltas: "(%) Faltas"
    reference_lines: [{reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#008B3B",
        range_start: '0.95', range_end: '1', label: "-"}, {reference_type: range,
        line_value: mean, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#FFA600", range_start: '0.90', range_end: '0.95',
        label: "-", value_format: ''}]
    trend_lines: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", d_turmas_end.nomemunicipio40, rank, d_turmas_end.total_alunos,
      f_medidas_end.presenca, faltas, f_medidas_end.total_aulas, f_medidas_end.total_amparo]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_column_widths:
      f_medidas_end.presenca: 120
    series_cell_visualizations:
      f_medidas_end.presenca:
        is_active: false
    series_text_format:
      f_medidas_end.presenca:
        align: center
    header_font_color: "#f8fff8"
    header_background_color: "#233D4D"
    conditional_formatting: [{type: greater than, value: 0.95, background_color: "#008B3B",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [f_medidas_end.presenca]}, {type: between, value: [
          0.9, 0.95], background_color: "#FFA600", font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [f_medidas_end.presenca]},
      {type: less than, value: 0.9, background_color: "#A31621", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [f_medidas_end.presenca]}]
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      ETAPA: d_turmas_end.descretapamodalidade
      TIPO DE ESCOLA: d_turmas_end.descrtipoestab
      CURSO: d_turmas_end.nomecursodet
      ZONA: d_turmas_end.descrzona
      MATRIZ CURRICULAR: d_matriz_end.descrabrevcomposicao
      NRE: d_turmas_end.nomenreabrev
      MUNICIPIO: d_turmas_end.nomemunicipio40
      ESCOLA: d_turmas_end.escola
      TURNO: d_turmas_end.descrturno
    row: 14
    col: 0
    width: 24
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 13
    col: 0
    width: 24
    height: 1
  - name: " (3)"
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
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"background-color: rgba(35, 61, 77, 0.1); padding: 10px;\
      \ display: flex; justify-content: center; gap: 15px; border-radius: 8px;\">\n\
      \    <a href=\"/embed/dashboards/31\" style=\"background-color: #233D4D; color:\
      \ white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-size:\
      \ 16px; transition: transform 0.2s ease, background-color 0.3s ease; margin-right:\
      \ 15px;\">MUNICIPIO ESCOLA</a>\n    <a href=\"/embed/dashboards/32?\" style=\"\
      background-color: #233D4D; color: white; padding: 10px 20px; border-radius:\
      \ 5px; text-decoration: none; font-size: 16px; transition: transform 0.2s ease,\
      \ background-color 0.3s ease; margin-right: 15px;\">ESCOLA TURMA</a>\n    <a\
      \ href=\"/embed/dashboards/30\" style=\"background-color: #233D4D; color: white;\
      \ padding: 10px 20px; border-radius: 5px; text-decoration: none; font-size:\
      \ 16px; transition: transform 0.2s ease, background-color 0.3s ease;\">TURMA</a>\n\
      </div>\n\n<script>\n  document.querySelectorAll('a').forEach(button => {\n \
      \   button.addEventListener('mousedown', function() {\n      this.style.transform\
      \ = 'scale(0.95)';\n    });\n    \n    button.addEventListener('mouseup', function()\
      \ {\n      this.style.transform = 'scale(1)';\n    });\n    \n    button.addEventListener('mouseleave',\
      \ function() {\n      this.style.transform = 'scale(1)';\n    });\n  });\n</script>\n"
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
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
    explore: f_medidas_end
    listens_to_filters: [TIPO DE ESCOLA, CURSO, ZONA, TURNO, MATRIZ CURRICULAR, SEMANA
        LETIVA, NRE, MUNICIPIO, ESCOLA]
    field: d_turmas_end.descretapamodalidade
  - name: TIPO DE ESCOLA
    title: TIPO DE ESCOLA
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mvp_looker_lk_rede_end
    explore: f_medidas_end
    listens_to_filters: [ETAPA, CURSO, ZONA, TURNO, MATRIZ CURRICULAR, SEMANA LETIVA,
      NRE, MUNICIPIO, ESCOLA]
    field: d_turmas_end.descrtipoestab
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
    explore: f_medidas_end
    listens_to_filters: [ETAPA, TIPO DE ESCOLA, ZONA, TURNO, MATRIZ CURRICULAR, SEMANA
        LETIVA, NRE, MUNICIPIO, ESCOLA]
    field: d_turmas_end.nomecursodet
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
    explore: f_medidas_end
    listens_to_filters: [ETAPA, TIPO DE ESCOLA, CURSO, TURNO, MATRIZ CURRICULAR, SEMANA
        LETIVA, NRE, MUNICIPIO, ESCOLA]
    field: d_turmas_end.descrzona
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
    explore: f_medidas_end
    listens_to_filters: [ETAPA, TIPO DE ESCOLA, CURSO, ZONA, MATRIZ CURRICULAR, SEMANA
        LETIVA, NRE, MUNICIPIO, ESCOLA]
    field: d_turmas_end.descrturno
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
    explore: f_medidas_end
    listens_to_filters: [ETAPA, TIPO DE ESCOLA, CURSO, ZONA, TURNO, SEMANA LETIVA,
      NRE, MUNICIPIO, ESCOLA]
    field: d_matriz_end.descrabrevcomposicao
  - name: SEMANA LETIVA
    title: SEMANA LETIVA
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mvp_looker_lk_rede_end
    explore: f_medidas_end
    listens_to_filters: [ETAPA, TIPO DE ESCOLA, CURSO, ZONA, TURNO, MATRIZ CURRICULAR,
      NRE, MUNICIPIO, ESCOLA]
    field: d_calendario_end.semana_letiva
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
    explore: f_medidas_end
    listens_to_filters: [ETAPA, TIPO DE ESCOLA, CURSO, ZONA, TURNO, MATRIZ CURRICULAR,
      SEMANA LETIVA, MUNICIPIO, ESCOLA]
    field: d_turmas_end.nomenreabrev
  - name: MUNICIPIO
    title: MUNICIPIO
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mvp_looker_lk_rede_end
    explore: f_medidas_end
    listens_to_filters: [ETAPA, TIPO DE ESCOLA, CURSO, ZONA, TURNO, MATRIZ CURRICULAR,
      SEMANA LETIVA, NRE, ESCOLA]
    field: d_turmas_end.nomemunicipio40
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
    explore: f_medidas_end
    listens_to_filters: [ETAPA, TIPO DE ESCOLA, CURSO, ZONA, TURNO, MATRIZ CURRICULAR,
      SEMANA LETIVA, NRE, MUNICIPIO]
    field: d_turmas_end.escola

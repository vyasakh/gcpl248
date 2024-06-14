---
- dashboard: Grid_dashboard
  title: Grid_title
  layout: grid
  rows:
    - elements: [look1, look1 (Copy 2)]
      height: 200
    - elements: [look1 (Copy 3), look1 (Copy)]
      height: 300
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: WGlRo81Vqgo5hCQQRRY370
  elements:
  - title: look1
    name: look1
    model: 0_vysakh_thelook
    explore: orders
    type: looker_grid
    fields: [users.traffic_source, orders.created_date, orders.status, users.country,
      users.state]
    sorts: [users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.traffic_source}"
      label: ts
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: ts
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
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
    value_labels: legend
    label_type: labPer
    listen:
      Traffic Source: orders.traffic_source
      Country: users.country
      Created Year: orders.created_year
    row: 0
    col: 0
    width: 6
    height: 4
  - title: look1 (Copy 2)
    name: look1 (Copy 2)
    model: 0_vysakh_thelook
    explore: orders
    type: looker_line
    fields: [users.traffic_source, orders.created_date, orders.status, users.country,
      users.state]
    sorts: [users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.traffic_source}"
      label: ts
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: ts
      _type_hint: string
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    listen:
      Traffic Source: orders.traffic_source
      Country: users.country
      Created Year: orders.created_year
    row: 0
    col: 6
    width: 6
    height: 4
  - title: look1 (Copy 3)
    name: look1 (Copy 3)
    model: 0_vysakh_thelook
    explore: orders
    type: looker_bar
    fields: [users.traffic_source, orders.created_date, orders.status, users.country,
      users.state]
    sorts: [users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.traffic_source}"
      label: ts
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: ts
      _type_hint: string
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Traffic Source: orders.traffic_source
      Country: users.country
      Created Year: orders.created_year
    row: 0
    col: 18
    width: 6
    height: 4
  - title: look1 (Copy)
    name: look1 (Copy)
    model: 0_vysakh_thelook
    explore: orders
    type: looker_scatter
    fields: [users.traffic_source, orders.created_date, orders.status, users.country,
      users.state]
    sorts: [users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${users.traffic_source}"
      label: ts
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: ts
      _type_hint: string
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    listen:
      Traffic Source: orders.traffic_source
      Country: users.country
      Created Year: orders.created_year
    row: 0
    col: 12
    width: 6
    height: 4
  filters:
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: Facebook
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: 0_vysakh_thelook
    explore: orders
    listens_to_filters: []
    field: orders.traffic_source
  - name: Country
    title: Country
    type: field_filter
    default_value: UK
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: 0_vysakh_thelook
    explore: orders
    listens_to_filters: []
    field: users.country
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: '2015'
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: 0_vysakh_thelook
    explore: orders
    listens_to_filters: []
    field: orders.created_year

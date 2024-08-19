view: order_items {
  sql_table_name: thelook.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    #type: number
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year,month_name]
    sql: ${TABLE}.created_at ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: sum_units {
    type: sum_distinct
    group_label: "Volume"
    label: "Units"
    description: "Unit Count"
    sql_distinct_key: ${id} ;;
    sql: ${sale_price};;
  }
  measure: count {
    type: count
    #drill_fields: [id, orders.id, inventory_items.id]
    link: {
      label: "Show as line plot"
      url: "
      {% assign vis_config = '{
      https:\/\/gcpl248.cloud.looker.com\/explore\/0_vysakh_thelook\/order_items?fields=order_items.id,orders.id,inventory_items.id&limit=500&column_limit=50&query_timezone=UTC&vis={\"x_axis_gridlines\":false,\"y_axis_gridlines\":true,\"show_view_names\":false,\"show_y_axis_labels\":true,\"show_y_axis_ticks\":true,\"y_axis_tick_density\":\"default\",\"y_axis_tick_density_custom\":5,\"show_x_axis_label\":true,\"show_x_axis_ticks\":true,\"y_axis_scale_mode\":\"linear\",\"x_axis_reversed\":false,\"y_axis_reversed\":false,\"plot_size_by_field\":false,\"trellis\":\"\",\"stacking\":\"\",\"limit_displayed_rows\":false,\"legend_position\":\"center\",\"point_style\":\"none\",\"show_value_labels\":false,\"label_density\":25,\"x_axis_scale\":\"auto\",\"y_axis_combined\":true,\"ordering\":\"none\",\"show_null_labels\":false,\"show_totals_labels\":false,\"show_silhouette\":false,\"totals_color\":\"#808080\",\"type\":\"looker_column\",\"show_row_numbers\":true,\"transpose\":false,\"truncate_text\":true,\"hide_totals\":false,\"hide_row_totals\":false,\"size_to_fit\":true,\"table_theme\":\"white\",\"enable_conditional_formatting\":false,\"header_text_alignment\":\"left\",\"header_font_size\":12,\"rows_font_size\":12,\"conditional_formatting_include_totals\":false,\"conditional_formatting_include_nulls\":false,\"defaults_version\":1,\"series_types\":{}}&filter_config={}&origin=share-expanded
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }
}

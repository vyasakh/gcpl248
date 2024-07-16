view: order_items {
  sql_table_name: thelook.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
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

  dimension: parameter_dynamic_id_direct_input {
    type: number
    sql: ${TABLE}.{% parameter parameter_id_options_direct_input %} ;;
  }

  parameter: parameter_id_options_direct_input{
    type: unquoted
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}

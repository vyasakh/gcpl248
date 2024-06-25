view: orders {
  sql_table_name: thelook.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: ids {
    type: number
    sql: ${id}*${id}*${id}*101 ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
    type: string
    can_filter: yes
    sql: ${TABLE}.status ;;
    link: {
      url: "/embed/dashboards/39?f[users.Country]= {{users.Country._value | url_encode}}&f[orders.created_year]={{orders.created_date._value| url_encode}}&f[users.traffic_source]={{users.traffic_source._value | url_encode}}"
      label: "view details"
    }
  }

  measure: total_percent_status {
    type: percent_of_total
    #filters: [status_kavya: "complete"]
    sql: ${total_orders} ;;
  }

  measure: total_orders {
    type: count_distinct
    sql: ${id} ;;
  }

  measure: kavya_test  {
    type: count_distinct
    sql: ${id} ;;
    html:
    {{ total_orders._rendered_value }}  ({{ total_percent_status._rendered_value }})</div>
    ;;
  }

  # measure: percent_status_pending {
  #   type: percent_of_total
  #   filters: [status_kavya: "pending"]
  #   sql: ${status_kavya} ;;
  # }

  dimension: status_kavya{
    type: string
    sql: ${TABLE}.status ;;
    # html:
    # {{ total_cases_hidden._rendered_value }}  ({{ total_cases_percent._rendered_value }})</div>
    # ;;
    description: "The current status of an existing order."
  }

  dimension: status_test {
    type: string
    sql: ${TABLE}.status ;;
    html: <div style= "font-size:18px;"><a href ="/embed/dashboards/39?f[users.Country]= {{users.Country._value | url_encode}}&f[orders.created_year]={{orders.created_date._value| url_encode}}&f[users.traffic_source]={{users.traffic_source._value | url_encode}}" style="color: #991E66;"> Specification </a> </div>;;
  }
  dimension: traffic_source {
    label: "Traffic Source < 20"
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
  }
}

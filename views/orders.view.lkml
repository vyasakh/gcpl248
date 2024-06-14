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
    timeframes: [raw, time, date, week, month, quarter, year,second]
    sql: ${TABLE}.created_at ;;
  }


  dimension: my_time{
    type: date_time
    sql: ${created_second} ;;
    value_format: "hh:mm:ss"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: traffic_source {
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
    filters: [created_quarter: "2015-Q1"]
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
  }

  measure: trial {
    type: number
    sql: if(${count}=0,null,${count}) ;;
  }

  measure: completed_count {
    type: count_distinct
    sql: ${id} ;;
    filters: [status: "complete"]
    drill_fields: [id]
  }
}

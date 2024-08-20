
view: sql_runner_query {
  derived_table: {
    sql: select id,status from orders ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum {
    type: sum
    sql: ${id} ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  set: detail {
    fields: [
        id,
  status
    ]
  }
}

view: users {
  sql_table_name: thelook.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes

    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    label: "city"
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;

  }
  dimension: dd {
    type: date
    # sql: ${created_date} ;;
    sql:STR_TO_DATE(DATE_FORMAT(${TABLE}.created_at, '%Y%m%d'), '%Y%m%d')  ;;
    html:  {{ rendered_value | date: "%b %d, %Y" }} ;;
    order_by_field: created_date
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    description: "gender"
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }
  dimension: lng {
    type: number
    sql: ${TABLE}.lng ;;
  }
  dimension: postcode {
    type: string
    sql: ${TABLE}.postcode ;;

  }

  dimension: get_in_touch {
    sql: "mailto:rchavan@google.com" ;;
    html: '<a href="{{ rendered_value }}" target="_blank" rel="noopener noreferrer">Get in touch</a>' ;;
  }

  dimension: get_in_touch1 {
    sql: "https://www.youtube.com" ;;
    html: <a href="{{rendered_value}}" target="_blank" rel="noopener noreferrer">　Get in touch　</a> ;;
  }


  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  measure: count {
    description: "count of users"
    type: count
    drill_fields: [id, last_name, first_name, orders.count]
  }
  parameter: date_granularity {
    type: unquoted
    allowed_value: { label: "Daily" value: "date" }
    allowed_value: { label: "Weekly" value: "week" }
    allowed_value: { label: "Monthly" value: "month" }
    allowed_value: { label: "Quarterly" value: "quarter" }
    allowed_value: { label: "Yearly" value: "year" }
  }
}

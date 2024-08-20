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

  parameter: period_range {
    label: "2: Number of Previous Periods"
    description: "Required for Period over Period. Select how many previous periods to visualize."
    type: number
    default_value: "2"
    allowed_value:{label: "0" value: "0"}
    allowed_value:{label: "1" value: "1"}
    allowed_value:{label: "2" value: "2"}
    allowed_value:{label: "3" value: "3"}
    allowed_value:{label: "4" value: "4"}
    allowed_value:{label: "5" value: "5"}
    allowed_value:{label: "6" value: "6"}
    allowed_value:{label: "7" value: "7"}
    allowed_value:{label: "8" value: "8"}
    allowed_value:{label: "9" value: "9"}
    allowed_value:{label: "10" value: "10"}
    allowed_value:{label: "11" value: "11"}
    allowed_value:{label: "12" value: "12"}
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

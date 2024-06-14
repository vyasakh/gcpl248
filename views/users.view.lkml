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

  dimension: end {
    type: date_time
    sql: ${created_time} ;;
    # html: {{ rendered_value | date: "%c" }};;

  }

  measure: average_handling_time_minutes {
    type: number
    # sql: safe_divide(ROUND(${end}),${age})/86400;;
    sql: (ROUND(${end})/${age})/86400 ;;
    value_format:"[hh]:mm:ss"
    label: "Average Handling Time in Minutes"
    description: "Average Handling Time in minutes"
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
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;

  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, orders.count]
  }

  dimension: dynamic_link {
    label: "Dynamic Link"
    type: string
    sql: ${state} ;;
    html:
    {% assign base_url = 'https://gcpl248.cloud.looker.com/dashboards/86' %}
    {% assign filters = _query.filters %}

    {% assign query_params = '' %}
    {% for filter in filters %}
    {% assign filter_name = filter.name %}
    {% assign filter_value = filter.value %}
    {% assign encoded_filter = filter_name | url_encode %}
    {% assign encoded_value = filter_value | url_encode %}
    {% if forloop.first %}
    {% assign query_params = query_params | append: encoded_filter | append: '=' | append: encoded_value %}
    {% else %}
    {% assign query_params = query_params | append: '&' | append: encoded_filter | append: '=' | append: encoded_value %}
    {% endif %}
    {% endfor %}

    {% assign final_url = base_url | append: '?' | append: query_params %}
    <a href='{{ final_url }}' target='_blank'>Link to Another Explore</a>
    ;;
  }



}

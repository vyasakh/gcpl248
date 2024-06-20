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

  parameter: item_to_add_up {
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "sale_price"
    }
    allowed_value: {
      label: "Total Cost"
      value: "cost"
    }
    allowed_value: {
      label: "Total Profit"
      value: "profit"
    }
  }

  parameter: timegrain {
    type: unquoted
    hidden: yes
    description: "Timegrain chosen by user"
    allowed_value: {
      label: "Daily"
      value: "DAY"
    }
    allowed_value: {
      label: "Weekly"
      value: "ISOWEEK"
    }
    allowed_value: {
      label: "Monthly"
      value: "MONTH"
    }
    allowed_value: {
      label: "Quarterly"
      value: "QUARTER"
    }
    allowed_value: {
      label: "Yearly"
      value: "YEAR"
    }
  }


  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: date1 {
    type: string
    sql: ${created_date} ;;
  }

  dimension: date_timegrained {
    type: date
    datatype: date
    allow_fill: no
    hidden: no
    sql:
      LEAST(${orders.created_date}, CURRENT_DATE() - 1)
    ;;
    description: "Human readable format, truncated to the chosen timegrain"
    label: "Date"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    link: {
      url: "/embed/dashboards/39?f[users.Country]= {{users.Country._value | url_encode}}&f[orders.created_year]={{orders.created_date._value| url_encode}}&f[users.traffic_source]={{users.traffic_source._value | url_encode}}"
      label: "view details"
      # Checking if drill to dashboard 20 with a model the embed user has no access to results in same repro.
      # Cookieless Embedded Page loads while tile shows "trouble loading data" not "Content could not be displayed"
      # url: "/embed/dashboards/20?f[users.Country]= {{users.Country._value | url_encode}}&f[orders.created_year]={{orders.created_date._value| url_encode}}&f[users.traffic_source]={{users.traffic_source._value | url_encode}}"
    }
  }
  dimension: status_test {
    type: string
    sql: ${TABLE}.status ;;
    html: <div style= "font-size:18px;"><a href ="/embed/dashboards/39?f[users.Country]= {{users.Country._value | url_encode}}&f[orders.created_year]={{orders.created_date._value| url_encode}}&f[users.traffic_source]={{users.traffic_source._value | url_encode}}" style="color: #991E66;"> Specification </a> </div>;;
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
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
  }
}

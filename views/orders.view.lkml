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

    drill_fields: [id,count]
    link: {
      label: "Show as grid"
      url: "@{drt}"
    }
    }
    measure: countdr {
      type: count
      drill_fields: [id,count]
      link: {
        label: "Show as line chart"
        url: "@{dr}"
      }
      }


}

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
  dimension: test2 {
    type: string
    sql: concat(${products.brand} , "<",  ${orders.status}, ">") ;;
  }

  dimension: test3 {
    type: string
    sql: concat(${products.brand} , "<",  ${users.age} , "ghd" , ">") ;;
  }


  dimension: sale_price2 {
    type: number
    sql: ${TABLE}.sale_price ;;
    html:  {% assign pop_val = sale_price._value %}
          {% if pop_val > 0 %}
          <div style='display: inline-block;'>
          <p style='color: #53b94e; font-size:100%;'>{{ sale_price._rendered_value }}</p>
          </div>
          {% elsif pop_val < 0 %}
          <div style='display: inline-block;'>
          <p style='color: #d84555; font-size:100%;'>{{ sale_price._rendered_value }}</p>
          </div>
          {% else %}
          <div style='display: inline-block;'>
          <p style='font-size:100%;'>{{ sale_price._rendered_value }}</p>
          </div>
          {% endif %} ;;
    value_format: "$#.00,\" K\""
  }

 measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}

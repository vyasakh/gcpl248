view: products {
  sql_table_name: thelook.products ;;
  drill_fields: [id]
  label: "products"

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    label: "brand"
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    label: "category"
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    label: "department"
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}

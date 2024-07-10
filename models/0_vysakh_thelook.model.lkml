connection: "thelook_mysql"

# include all the views
include: "/views/**/*.view.lkml"

access_grant: is_internal_only {
  user_attribute: is_internal
  allowed_values: ["true"]
}


datagroup: 0_vysakh_thelook_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: 0_vysakh_thelook_default_datagroup

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  always_filter: {filters: [id: "1234"]}
}


explore: order_items {
  label: "order items"
  # conditionally_filter: {
  #   filters: [order_items.created_year: "2018"]

  #   filters: [order_items.created_month_name: "June"]

  # unless: [users.country]
  # }
  # sql_always_where: 1=1 ;;
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  always_filter: {filters: [orders.timegrain: "MONTH"]}
}

explore: products {}

explore: users {}

explore: xss {}

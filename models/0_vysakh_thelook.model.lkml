connection: "thelook_mysql"

# include all the views
include: "/views/**/*.view.lkml"

access_grant: is_internal_only {
  user_attribute: is_internal
  allowed_values: ["true"]
}


include: "/Auto-refresh.dashboard.lookml"



datagroup: 0_vysakh_thelook_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: 0_vysakh_thelook_default_datagroup


access_grant: test {
  user_attribute: test_purpose
  allowed_values: ["0"]
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  always_filter: {filters: [id: "1234"]}
}


explore: order_items {
  # label: "order items"
  # conditionally_filter: {
  #   filters: [order_items.created_year: " 1 year ago for 1 year"]

  #   filters: [order_items.created_month_name: "7 months ago for 7 months"]

  #   filters: [order_items.created_date: "7 days ago for 7 days"]

  # unless: [users.country]
  # }



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
    type: cross
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  hidden: yes
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  always_filter: {filters: [orders.user_id: "MONTH"]}
}


explore: products {}

explore: add_a_unique_name_1723701937{}

explore: sql_runner_query {}

explore: derive {}

explore: users {}

explore: xss {}

---
- dashboard: filter_merge_result
  title: Filter_Merge_REsult
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  refresh: 4 minutes
  preferred_slug: kFSWLIuUzosePb45oWLXtJ
  elements:
  - name: Table
    title: Table
    merged_queries:
    - model: 0_vysakh_thelook
      explore: order_items
      type: table
      fields: [orders.id, orders.user_id, orders.status]
      filters:
        orders.created_date: 10 years
      sorts: [orders.id desc]
      limit: 500
      column_limit: 50
    - model: 0_vysakh_thelook
      explore: order_items
      type: table
      fields: [users.id, users.count, orders.id, orders.status]
      sorts: [users.id desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: users.id
        source_field_name: orders.user_id
      - field_name: orders.id
        source_field_name: orders.id
      - field_name: orders.status
        source_field_name: orders.status
    - model: 0_vysakh_thelook
      explore: order_items
      type: table
      fields: [order_items.order_id, sum_of_sale_price, orders.id, users.id]
      sorts: [order_items.order_id desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - measure: sum_of_sale_price
        based_on: order_items.sale_price
        expression: ''
        label: Sum of Sale Price
        type: sum
        _kind_hint: measure
        _type_hint: number
      join_fields:
      - field_name: users.id
        source_field_name: orders.user_id
      - field_name: orders.id
        source_field_name: orders.id
    hidden_fields: [users.count, order_items.order_id]
    type: looker_grid
    row: 0
    col: 0
    width: 8
    height: 6

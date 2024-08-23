view: add_a_unique_name_1723701937 {
  derived_table: {
    explore_source: orders {

      dev_filters: [orders.status: "PENDING"]
      filters: [orders.created_year: "2023"]
      column: status {}
      column: count {}
    }
  }
  dimension: status {
    description: ""

  }
  dimension: count {
    description: ""
    type: number
  }
}

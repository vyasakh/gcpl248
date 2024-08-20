# If necessary, uncomment the line below to include explore_source.
# include: "0_vysakh_thelook.model.lkml"

view: derive {
  derived_table: {
    explore_source: orders {
      column: id {}
      column: status {}
    }
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: status {
    description: ""
  }

  measure: count {
    type: sum
    sql: ${id} ;;
  }
}

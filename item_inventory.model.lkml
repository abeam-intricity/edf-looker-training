connection: "edf_snowflake"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: inventory {
  join: warehouse {
    relationship: many_to_one
    sql_on: ${inventory.inv_warehouse_sk} = ${warehouse.w_warehouse_sk} ;;
  }
  join: item {
    relationship: many_to_one
    sql_on: ${inventory.inv_item_sk} = ${item.i_item_sk} ;;
  }
}

explore: date_dim {}

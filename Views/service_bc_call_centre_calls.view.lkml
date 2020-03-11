# include: "/Includes/date_dimensions.view"

view: service_bc_call_centre_calls {

  # extends: [date_dimensions]

  derived_table: {
    sql: SELECT
          cc.*
        FROM servicebc.call_centre_calls AS cc
        ;;
  }

  # datekey the join reference for datedimension -- this is currently an INT in the Redshift table which cannot cast to a date and so cannot be joined
  dimension: datekey {
    type: number
    sql: ${TABLE}.datekey ;;
    group_label:  "Date"
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    group_label: "Call Info"
  }

  ## No joining table currently exists for timekey
  dimension: timekey {
    type: number
    sql: ${TABLE}.timekey ;;
    group_label: "Time"
  }

  dimension: uwfagentid {
    type: number
    sql: ${TABLE}.uwfagentid ;;
    group_label: "Call Info"
  }

  dimension: instance {
    type: string
    sql: ${TABLE}.instance ;;
    group_label: "Call Info"
  }

  dimension: contactreason {
    type: string
    sql: ${TABLE}.contactreason ;;
    group_label: "Call Info"
  }

  dimension: contactreasondetail {
    type: string
    sql: ${TABLE}.contactreasondetail ;;
    group_label: "Call Info"
  }

  dimension: wraptime {
    type: number
    sql: ${TABLE}.wraptime ;;
    group_label: "Time"
  }

  dimension: activetime {
    type: number
    sql: ${TABLE}.activetime ;;
    group_label: "Time"
  }

  dimension: presentingtime {
    type: number
    sql: ${TABLE}.presentingtime ;;
    group_label: "Time"
  }

  dimension: suspendtime {
    type: number
    sql: ${TABLE}.suspendtime ;;
    group_label: "Time"
  }

  dimension: suspendcount {
    type: number
    sql: ${TABLE}.suspendcount ;;
    group_label: "Call Info"
  }

  dimension: tsfflag {
    type: number
    sql: ${TABLE}.tsfflag ;;
    group_label: "Call Info"
  }

  measure: count {
    type: count
  }
}

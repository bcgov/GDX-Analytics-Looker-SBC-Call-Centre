# include: "/Includes/date_dimensions.view"

view: service_bc_call_centre_esb_data {

  # extends: [date_dimensions]

  derived_table: {
    sql: SELECT
          esb.*
        FROM servicebc.call_centre_esb_data as esb
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
    group_label: "ESB Info"
  }

  dimension: skillgroup {
    type: string
    sql: ${TABLE}.skillgroup ;;
    group_label: "ESB Info"
  }

  dimension: contactreason {
    type: string
    sql: ${TABLE}.contactreason ;;
    group_label: "ESB Info"
  }

  dimension: contactreasondetail {
    type: string
    sql: ${TABLE}.contactreasondetail ;;
    group_label: "ESB Info"
  }

  dimension: interval {
    type: string
    sql: ${TABLE}.interval ;;
    group_label: "Time"
  }

  dimension: answeredwithinservicelevel {
    type: yesno
    sql: ${TABLE}.answeredwithinservicelevel ;;
    group_label: "ESB Info"
  }

  dimension: callputonhold {
    type: number
    sql: ${TABLE}.callputonhold ;;
    group_label: "ESB Info"
  }

  dimension: handletime {
    type: number
    sql: ${TABLE}.handletime ;;
    group_label: "Time"
  }

  dimension: waittime {
    type: number
    sql: ${TABLE}.waittime ;;
    group_label: "Time"
  }

  dimension: wraptime {
    type: number
    sql: ${TABLE}.wraptime ;;
    group_label: "Time"
  }

  dimension: talktime {
    type: number
    sql: ${TABLE}.talktime ;;
    group_label: "Time"
  }

  dimension: holdtime {
    type: number
    sql: ${TABLE}.holdtime ;;
    group_label: "Time"
  }

  dimension: incomingphonenumber {
    type: string
    sql: ${TABLE}.incomingphonenumber ;;
    group_label: "ESB Info"
  }

  measure: count {
    type: count
  }
}

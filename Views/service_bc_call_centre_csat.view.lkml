# include: "/Includes/date_dimensions.view"

view: service_bc_call_centre_csat {

  # extends: [date_dimensions]

  derived_table: {
    sql: SELECT
          csat.*
        FROM servicebc.call_centre_csat as csat
        ;;
  }

  # datekey the join reference for datedimension -- this is currently an INT in the Redshift table which cannot cast to a date and so cannot be joined
  dimension: datekey {
    type: number
    sql: ${TABLE}.datekey ;;
    group_label:  "Date"
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
    group_label: "CSAT Info"
  }

  ## No joining table currently exists for timekey
  dimension: timekey {
    type: number
    sql: ${TABLE}.timekey ;;
    group_label: "Time"
  }

  dimension: skillgroupchannel {
    type: string
    sql: ${TABLE}.skillgroupchannel ;;
    group_label: "CSAT Info"
  }

  dimension: altskillgroupchannel {
    type: string
    sql: ${TABLE}.altskillgroupchannel ;;
    group_label: "CSAT Info"
  }

  dimension: ani {
    type: string
    sql: ${TABLE}.ani ;;
    group_label: "CSAT Info"
  }

  dimension: peripheralcalltype {
    type: number
    sql: ${TABLE}.peripheralcalltype ;;
    group_label: "CSAT Info"
  }

  dimension: transfered {
    type: yesno
    sql: ${TABLE}.transfered ;;
    group_label: "CSAT Info"
  }

  dimension: digitsdialed {
    type: string
    sql: ${TABLE}.digitsdialed ;;
    group_label: "CSAT Info"
  }

  dimension: surveychannel {
    type: string
    sql: ${TABLE}.surveychannel ;;
    group_label: "CSAT Info"
  }

  dimension: s1csat {
    type: number
    sql: ${TABLE}.s1csat ;;
    group_label: "CSAT Info"
  }

  dimension: s2csat {
    type: number
    sql: ${TABLE}.s2csat ;;
    group_label: "CSAT Info"
  }

  dimension: s3csat {
    type: number
    sql: ${TABLE}.s3csat ;;
    group_label: "CSAT Info"
  }

  dimension: s4csat {
    type: number
    sql: ${TABLE}.s4csat ;;
    group_label: "CSAT Info"
  }

  dimension: s5csat {
    type: number
    sql: ${TABLE}.s5csat ;;
    group_label: "CSAT Info"
  }

  measure: count {
    type: count
  }
}

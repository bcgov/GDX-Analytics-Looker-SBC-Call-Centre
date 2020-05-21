include: "/Includes/date_dimensions.view"

view: service_bc_call_centre_esb_data {

  extends: [date_dimensions]

  derived_table: {
    sql: SELECT
          esb.*,
          dd.isweekend::BOOLEAN,
          dd.isholiday::BOOLEAN,
          dd.lastdayofpsapayperiod::date,
          dd.fiscalyear,
          dd.fiscalmonth,
          dd.fiscalquarter,
          dd.sbcquarter,
          dd.day,
          dd.weekday,
          dd.weekdayname
        FROM servicebc.call_centre_esb_data_gsxdxd2660 as esb
        JOIN servicebc.datedimension AS dd
        ON esb.datekey = dd.datekey
        ;;
  }

  # datekey the join reference for datedimension
  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      # quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.datekey ;;
    group_label:  "Date"
    # Setting the label to nothing supresses the dimension_groups name appearing before the timeframe in the field label
    # Without this, labels on these timeframes will appear as "Date Date" and "Date Week", for example.
    label: ""
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

include: "/Includes/date_dimensions.view"

view: service_bc_call_centre {

  extends: [date_dimensions]

  derived_table: {
    sql: SELECT
          ccl.*,
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
        FROM servicebc.call_centre AS ccl
        JOIN servicebc.datedimension AS dd
        ON ccl.datekey = dd.datekey
        ;;
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: number
    group_label: "Call Info"
  }
  dimension: skill_group {
    sql: ${TABLE}.skillgroup ;;
    type: string
    group_label: "Call Info"
  }
  dimension: contact_reason {
    sql: CASE WHEN (${TABLE}.contactreason = '') THEN NULL ELSE ${TABLE}.contactreason END ;;
    type: string
    group_label: "Call Info"
  }
  dimension: contact_reason_detail {
    sql: CASE WHEN (${TABLE}.contactreasondetail = '') THEN NULL ELSE ${TABLE}.contactreasondetail END ;;
    type: string
    group_label: "Call Info"
  }
  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
#       quarter,
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

  dimension: interval {
    sql: ${TABLE}.interval ;;
    type: string
    group_label:  "Date"
  }
  dimension: answered_within_service_level {
    sql: ${TABLE}.answeredwithinservicelevel ;;
    type: yesno
    group_label: "Call Info"
  }
  dimension: call_put_on_hold {
    sql: ${TABLE}.callputonhold ;;
    type: yesno
    group_label: "Call Info"
  }
  dimension: handle_time {
    sql: ${TABLE}.handletime ;;
    type: number
    value_format: "[h]:mm:ss"
    group_label: "Call Times"
  }
  dimension: wait_time {
    sql: ${TABLE}.waittime ;;
    type: number
    value_format: "[h]:mm:ss"
    group_label: "Call Times"
  }
  dimension: wrap_time {
    sql: ${TABLE}.wraptime ;;
    type: number
    value_format: "[h]:mm:ss"
    group_label: "Call Times"
  }
  dimension: talk_time {
    sql: ${TABLE}.talktime ;;
    type: number
    value_format: "[h]:mm:ss"
    group_label: "Call Times"
  }
  dimension: hold_time {
    sql: ${TABLE}.holdtime ;;
    type: number
    value_format: "[h]:mm:ss"
    group_label: "Call Times"
  }
  dimension: phone_number {
    sql: ${TABLE}.incomingphonenumber ;;
    type: string
    group_label: "Incoming Number"
  }
  dimension: area_code{
    sql: REGEXP_REPLACE ( ${TABLE}.incomingphonenumber, '^(\\d\\d\\d)\\d\\d\\dXXXX$', '$1' );;
    type: string
    group_label: "Incoming Number"
  }
  dimension: exchange {
    sql: REGEXP_REPLACE ( ${TABLE}.incomingphonenumber, '^\\d\\d\\d(\\d\\d\\d)XXXX$', '$1' );;
    type: string
    group_label: "Incoming Number"
  }


  measure: handle_time_total {
    sql: ${TABLE}.handletime ;;
    type: sum
    value_format: "[h]:mm:ss"
    group_label: "Call Time Totals"
  }
  measure: wait_time_total {
    sql: ${TABLE}.waittime ;;
    type: sum
    value_format: "[h]:mm:ss"
    group_label: "Call Time Totals"
  }
  measure: wrap_time_total {
    sql: ${TABLE}.wraptime ;;
    type: sum
    value_format: "[h]:mm:ss"
    group_label: "Call Time Totals"
  }
  measure: talk_time_total {
    sql: ${TABLE}.talktime ;;
    type: sum
    value_format: "[h]:mm:ss"
    group_label: "Call Time Totals"
  }
  measure: hold_time_total {
    sql: ${TABLE}.holdtime ;;
    type: sum
    value_format: "[h]:mm:ss"
    group_label: "Call Time Totals"
  }

  measure: handle_time_average {
    sql: ${TABLE}.handletime ;;
    type: average
    value_format: "[h]:mm:ss"
    group_label: "Call Time Averages"
  }
  measure: wait_time_average {
    sql: ${TABLE}.waittime ;;
    type: average
    value_format: "[h]:mm:ss"
    group_label: "Call Time Averages"
  }
  measure: wrap_time_average {
    sql: ${TABLE}.wraptime ;;
    type: average
    value_format: "[h]:mm:ss"
    group_label: "Call Time Averages"
  }
  measure: talk_time_average {
    sql: ${TABLE}.talktime ;;
    type: average
    value_format: "[h]:mm:ss"
    group_label: "Call Time Averages"
  }
  measure: hold_time_average {
    sql: ${TABLE}.holdtime ;;
    type: average
    value_format: "[h]:mm:ss"
    group_label: "Call Time Averages"
  }
  measure: count {
    type: count
    label: "Call Count"
  }
}

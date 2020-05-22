include: "/Includes/date_dimensions.view"

view: service_bc_call_centre_calls {

  extends: [date_dimensions]

  derived_table: {
    sql: SELECT
          ccc.*,
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
        FROM servicebc.call_centre_calls AS ccc
        JOIN servicebc.datedimension AS dd
        ON ccc.datekey = dd.datekey
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

  ## remaining dimensions from call_centre_calls

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

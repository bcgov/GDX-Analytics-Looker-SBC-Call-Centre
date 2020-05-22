include: "/Includes/date_dimensions.view"

view: service_bc_call_centre_escalation {

  extends: [date_dimensions]

  derived_table: {
    sql: SELECT
          escl.id,
          escl.group,
          escl.areaofincidentorrequest,
          escl.receiveddatekey,
          escl.receivedtimekey,
          escl.completeddatekey,
          escl.businessdaysaged,
          escl.resolvedwithinreportingmonth,
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
        FROM servicebc.call_centre_escalation_gdxdsd2660 as escl
        JOIN servicebc.datedimension AS dd
        ON escl.receiveddatekey = dd.datekey
        ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    group_label: "Escalation Info"
  }

  dimension: group {
    type: string
    sql: ${TABLE}.group ;;
    group_label: "Escalation Info"
  }

  dimension: areaofincidentorrequest {
    type: string
    sql: ${TABLE}.areaofincidentorrequest ;;
    group_label: "Escalation Info"
  }

  dimension_group: receiveddatekey {
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
    sql: ${TABLE}.receiveddatekey ;;
    group_label:  "Date"
    label: "Received"
  }

  dimension: receivedtimekey {
    type: number
    sql: ${TABLE}.receivedtimekey ;;
  }

  dimension_group: completeddatekey {
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
    sql: ${TABLE}.completeddatekey ;;
    group_label:  "Date"
    label: "Completed"
  }

  dimension: businessdaysaged {
    type: number
    sql: ${TABLE}.businessdaysaged ;;
    group_label: "Escalation Info"
  }

  dimension: resolvedwithinreportingmonth {
    type: yesno
    sql: ${TABLE}.resolvedwithinreportingmonth ;;
    group_label: "Escalation Info"
  }

  measure: count {
    type: count
  }
}

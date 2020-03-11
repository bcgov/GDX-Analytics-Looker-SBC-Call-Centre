view: service_bc_call_centre_escalation {

  derived_table: {
    sql: SELECT
          escl.id,
          escl.group,
          escl.areaofincidentorrequest,
          escl.receiveddatekey,
          escl.receivedtimekey,
          escl.completeddatekey,
          escl.businessdaysaged,
          escl.resolvedwithinreportingmonth
        FROM servicebc.call_centre_escalation as escl
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

  dimension: receiveddatekey {
    type: number
    sql: ${TABLE}.receiveddatekey ;;
  }

  dimension: receivedtimekey {
    type: number
    sql: ${TABLE}.receivedtimekey ;;
  }

  dimension: completeddatekey {
    type: number
    sql: ${TABLE}.completeddatekey ;;
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

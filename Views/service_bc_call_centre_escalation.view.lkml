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
  }

  dimension: group {
    type: string
    sql: ${TABLE}.group ;;
  }

  dimension: areaofincidentorrequest {
    type: string
    sql: ${TABLE}.areaofincidentorrequest ;;
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
  }

  dimension: resolvedwithinreportingmonth {
    type: yesno
    sql: ${TABLE}.resolvedwithinreportingmonth ;;
  }

  measure: count {
    type: count
  }
}

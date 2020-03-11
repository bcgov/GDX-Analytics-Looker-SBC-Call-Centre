view: service_bc_call_centre_esb_data {
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
        FROM servicebc.call_centre_esb_data as esb
        JOIN servicebc.datedimension AS dd
        ON esb.datekey::date = dd.datekey::date
        ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: skillgroup {
    type: string
    sql: ${TABLE}.skillgroup ;;
  }

  dimension: contactreason {
    type: string
    sql: ${TABLE}.contactreason ;;
  }

  dimension: contactreasondetail {
    type: string
    sql: ${TABLE}.contactreasondetail ;;
  }

  dimension: datekey {
    type: number
    sql: ${TABLE}.datekey ;;
  }

  dimension: interval {
    type: string
    sql: ${TABLE}.interval ;;
  }

  dimension: answeredwithinservicelevel {
    type: yesno
    sql: ${TABLE}.answeredwithinservicelevel ;;
  }

  dimension: callputonhold {
    type: number
    sql: ${TABLE}.callputonhold ;;
  }

  dimension: handletime {
    type: number
    sql: ${TABLE}.handletime ;;
  }

  dimension: waittime {
    type: number
    sql: ${TABLE}.waittime ;;
  }

  dimension: wraptime {
    type: number
    sql: ${TABLE}.wraptime ;;
  }

  dimension: talktime {
    type: number
    sql: ${TABLE}.talktime ;;
  }

  dimension: holdtime {
    type: number
    sql: ${TABLE}.holdtime ;;
  }

  dimension: incomingphonenumber {
    type: string
    sql: ${TABLE}.incomingphonenumber ;;
  }

  measure: count {
    type: count
  }
}

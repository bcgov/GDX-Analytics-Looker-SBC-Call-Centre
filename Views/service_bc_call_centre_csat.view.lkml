view: service_bc_call_centre_csat {
  derived_table: {
    sql: SELECT
          csat.*,
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
        FROM servicebc.call_centre_csat as csat
        JOIN servicebc.datedimension AS dd
        ON csat.datekey::date = dd.datekey::date
        ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: datekey {
    type: number
    sql: ${TABLE}.datekey ;;
  }

  dimension: timekey {
    type: number
    sql: ${TABLE}.timekey ;;
  }

  dimension: skillgroupchannel {
    type: string
    sql: ${TABLE}.skillgroupchannel ;;
  }

  dimension: altskillgroupchannel {
    type: string
    sql: ${TABLE}.altskillgroupchannel ;;
  }

  dimension: ani {
    type: string
    sql: ${TABLE}.ani ;;
  }

  dimension: peripheralcalltype {
    type: number
    sql: ${TABLE}.peripheralcalltype ;;
  }

  dimension: transfered {
    type: yesno
    sql: ${TABLE}.transfered ;;
  }

  dimension: digitsdialed {
    type: string
    sql: ${TABLE}.digitsdialed ;;
  }

  dimension: surveychannel {
    type: string
    sql: ${TABLE}.surveychannel ;;
  }

  dimension: s1csat {
    type: number
    sql: ${TABLE}.s1csat ;;
  }

  dimension: s2csat {
    type: number
    sql: ${TABLE}.s2csat ;;
  }

  dimension: s3csat {
    type: number
    sql: ${TABLE}.s3csat ;;
  }

  dimension: s4csat {
    type: number
    sql: ${TABLE}.s4csat ;;
  }

  dimension: s5csat {
    type: number
    sql: ${TABLE}.s5csat ;;
  }

  measure: count {
    type: count
  }
}

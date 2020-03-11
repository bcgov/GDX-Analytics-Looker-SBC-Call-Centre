view: service_bc_call_centre_calls {
  derived_table: {
    sql: SELECT
          cc.*,
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
        FROM servicebc.call_centre_calls AS cc
        JOIN servicebc.datedimension AS dd
        ON cc.datekey::date = dd.datekey::date
        ;;
  }

  dimension: id {
    type: number
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

  dimension: uwfagentid {
    type: number
    sql: ${TABLE}.uwfagentid ;;
  }

  dimension: instance {
    type: string
    sql: ${TABLE}.instance ;;
  }

  dimension: contactreason {
    type: string
    sql: ${TABLE}.contactreason ;;
  }

  dimension: contactreasondetail {
    type: string
    sql: ${TABLE}.contactreasondetail ;;
  }

  dimension: wraptime {
    group_label: "Time dimensions"
    type: number
    sql: ${TABLE}.wraptime ;;
  }

  dimension: activetime {
    group_label: "Time dimensions"
    type: number
    sql: ${TABLE}.activetime ;;
  }

  dimension: presentingtime {
    group_label: "Time dimensions"
    type: number
    sql: ${TABLE}.presentingtime ;;
  }

  dimension: suspendtime {
    group_label: "Time dimensions"
    type: number
    sql: ${TABLE}.suspendtime ;;
  }

  dimension: suspendcount {
    group_label: "Time dimensions"
    type: number
    sql: ${TABLE}.suspendcount ;;
  }

  dimension: tsfflag {
    type: number
    sql: ${TABLE}.tsfflag ;;
  }

  measure: count {
    type: count
  }
}

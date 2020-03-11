view: date_dimensions {

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

  dimension: is_weekend {
    type:  yesno
    sql:  ${TABLE}.isweekend ;;
    group_label:  "Date"
  }

  dimension: is_holiday {
    type:  yesno
    sql:  ${TABLE}.isholiday ;;
    group_label:  "Date"
  }

  dimension: day_of_week {
    type:  string
    sql:  ${TABLE}.weekdayname ;;
    group_label:  "Date"
  }

  dimension: day_of_week_number {
    type: number
    sql: ${TABLE}.weekday ;;
    group_label: "Date"
  }

  dimension: sbc_quarter {
    type:  string
    sql:  ${TABLE}.sbcquarter ;;
    group_label:  "Date"
  }

  dimension: last_day_of_pay_period {
    type: date
    sql:  ${TABLE}.lastdayofpsapayperiod ;;
    group_label: "Date"
  }

  dimension: day_of_month {
    type: number
    sql: ${TABLE}.day ;;
    group_label: "Date"
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscalyear ;;
    group_label: "Date"
  }

  dimension: fiscal_month {
    type: number
    sql: ${TABLE}.fiscalmonth ;;
    group_label: "Date"
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscalquarter ;;
    group_label: "Date"
  }

  dimension: fiscal_quarter_of_year {
    type: string
    sql:  'Q' || ${fiscal_quarter} ;;
    group_label:  "Date"
  }
}

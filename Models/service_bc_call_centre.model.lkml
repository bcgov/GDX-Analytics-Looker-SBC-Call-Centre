connection: "redshift_pacific_time"

# include all the views
include: "/Views/**/*.view"

label: "Service BC Call Centre"

explore: service_bc_call_centre {
  label: "Service BC Call Centre"
}

explore: service_bc_call_centre_calls {
  label: "Service BC Call Centre Calls"
}

explore: service_bc_call_centre_csat {
  label: "Service BC Call Centre CSAT"
}

explore: service_bc_call_centre_esb_data {
  label: "Service BC Call Centre ESB Data"
}

explore: service_bc_call_centre_escalation {
  label: "Service BC Call Centre Escalation"
}

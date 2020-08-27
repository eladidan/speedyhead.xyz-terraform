resource "google_billing_budget" "budget" {
  provider = google-beta
  billing_account = var.billing_account
  display_name = "Speedyhead billing budget"
  amount {
    specified_amount {
      currency_code = "USD"
      units = "50"
    }
  }
  threshold_rules {
      threshold_percent =  0.5
  }
  threshold_rules {
    threshold_percent = 0.9
    spend_basis = "FORECASTED_SPEND"
  }
  all_updates_rule {
    monitoring_notification_channels = [
      google_monitoring_notification_channel.notification_channel.id,
    ]
  }
}

resource "google_monitoring_notification_channel" "notification_channel" {
  provider     = google-beta
  display_name = "Speedyhead Notification Channel"
  type         = "email"

  labels = {
    email_address = var.notification_email
  }
}

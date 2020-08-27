resource "random_id" "id" {
  byte_length = 6
  prefix      = var.project_name
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = random_id.id.hex
  billing_account = var.billing_account
  org_id          = var.org_id
}

resource "google_project_service" "service" {
  for_each = toset(var.services)

  service = each.key

  project            = google_project.project.project_id
  disable_on_destroy = false
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "speedyhead"

    workspaces {
      name = "speedyhead"
    }
  }
}

terraform {
  backend "remote" {
    organization = "jaybeeTraining"
    workspaces {
      name = "devopsTraining"
    }
  }
}

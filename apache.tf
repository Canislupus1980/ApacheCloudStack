terraform {
  required_providers {
    cloudstack = {
      source = "cloudstack/cloudstack"
      version = "0.4.0"
    }
  }
}

provider "cloudstack" {
  api_url    = "${var.cloudstack_api_url}"
  api_key    = "${var.cloudstack_api_key}"
  secret_key = "${var.cloudstack_secret_key}"
}

resource "cloudstack_instance" "depesha_server" {
    zone                = var.zone

    project             = var.project
    network_id          = "7926153f-f284-43e9-9ffd-d27299e62f54"
    name                =  var.name
    display_name        = "TN ${var.name}"
    service_offering    = "L-Small Instance"
    template            = "Debian 11.1"

keypair            = var.keypair
expunge             = true
tags                = var.tags
}

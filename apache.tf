terraform {
  required_providers {
    cloudstack = {
      source            = "cloudstack/cloudstack"
      version           = "0.4.0"
    }
  }
}

provider "cloudstack" {
  api_url               = "${var.cloudstack_api_url}"
  api_key               = "${var.cloudstack_api_key}"
  secret_key            = "${var.cloudstack_secret_key}"
}

resource "cloudstack_instance" "Jenkins" {
    #count               = 2
    zone                = var.zone
    network_id          = "b5b66fc0-fa61-4bac-ba32-a1248dfc664b"
    name                = var.name
    display_name        = "TN ${var.name}"
    service_offering    = "L-Small Instance"
    template            = "9420cb9e-3dbe-4e26-bf67-2ca70c0036d7"
    expunge             = true
    user_data           = file("user_data.sh")

    # optional parameter
    keypair             = "jenkins"
    root_disk_size      = 30


    tags = {
        Name            = "Jenkins Server"
        Owner           = "Sergey Buhtiyarov"
        Project         = "Terraform Cloudstack CICD"
    }    
}

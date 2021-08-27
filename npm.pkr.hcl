packer {
  required_plugins {
    googlecompute = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "npm-instruqt" {
  project_id = "nrge-316315"
  source_image_family = "ubuntu-2004-lts"
  ssh_username = "packer"
  zone = "us-central1-a"
  image_name = "network-performance-monitoring-instruqt"
}

build {
  sources = ["sources.googlecompute.npm-instruqt"]

  provisioner "shell" {
    inline = [
        "mkdir lab-config/snmpwalks/",
        "mkdir lab-config/snmpwalks/cisco-switch/",
        "mkdir lab-config/snmpwalks/linksys-router/",
        "mkdir lab-config/snmpwalks/workstation-1/",
        "mkdir lab-config/snmpwalks/workstation-2/",
        "mkdir lab-config/snmpwalks/workstation-3/",
    ]
  }

  provisioner "file" {
    source = "./files/cisco-switch.snmprec"
    destination = "lab-config/snmpwalks/cisco-switch/public.snmprec"
  }

  provisioner "file" {
    source = "./files/linksys-router.snmprec"
    destination = "lab-config/snmpwalks/linksys-router/public.snmprec"
  }

  provisioner "file" {
    source = "./files/workstation-1.snmprec"
    destination = "lab-config/snmpwalks/workstation-1/public.snmprec"
  }

  provisioner "file" {
    source = "./files/workstation-2.snmprec"
    destination = "lab-config/snmpwalks/workstation-2/public.snmprec"
  }

  provisioner "file" {
    source = "./files/workstation-3.snmprec"
    destination = "lab-config/snmpwalks/workstation-3/public.snmprec"
  }

  provisioner "shell" {
    scripts = [
        "./scripts/install-dependencies.sh",
        "./scripts/setup-docker.sh",
    ]
  }
}
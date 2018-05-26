provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_tag" "dmarby" {
  name = "dmarby"
}

resource "digitalocean_ssh_key" "dmarby" {
  name       = "DMarby"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "digitalocean_droplet" "dmarby" {
  name               = "dmarby.se"
  size               = "s-1vcpu-1gb"
  image              = "coreos-stable"
  region             = "ams3"
  ipv6               = true
  monitoring         = false
  private_networking = false
  backups            = false
  ssh_keys           = ["${digitalocean_ssh_key.dmarby.fingerprint}"]
  tags               = ["${digitalocean_tag.dmarby.id}"]
  user_data          = "${file("files/cloud-config.yml")}"
}

resource "digitalocean_floating_ip" "dmarby" {
  droplet_id = "${digitalocean_droplet.dmarby.id}"
  region     = "${digitalocean_droplet.dmarby.region}"
}
